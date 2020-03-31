<%@page import="MVC.*"%>
<%@page import="Beans.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.*"%>

<%
	Book b = new Book();
	
	final String FileLocation = request.getServletContext().getInitParameter("Book Photo Location") + "\\"; 

	if(ServletFileUpload.isMultipartContent(request))
	{
		try{
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
			for(FileItem item : multiparts)
			{
				// Form Data Values
				if(item.isFormField())
				{
					String value = item.getString();
					
					switch(item.getFieldName())
					{
						case "title":	b.setTitle(value);
										break;
										
						case "author": 	b.setAuthor(value);
										break;
										
						case "desc":	b.setDescription(value);
										break;
										
						case "avail":	b.setCopies_available(Integer.parseInt(value));
										break;
										
						case "section": b.setSection(value);
										break;	
										
						case "shelf":	b.setShelf(Integer.parseInt(value));
										break;
										
						case "tags":	b.setTags(value);
										break;
										
						default: 		break;
										
						
					}
				}
				
				// Form File Value
				else
				{
					String name = UUID.randomUUID().toString().substring(0, 30) + item.getName().substring(item.getName().lastIndexOf('.'));
					System.out.println(FileLocation +  name);
					File f = new File(FileLocation + name);
					
					f.createNewFile();
					item.write(f);
										
					b.setPhoto_loc(name);
				}
			}
			
			if(Model.getInstance().addBook(b))
				{
					session.setAttribute("Book", b);
					response.sendRedirect(Pages.ADD_BOOK_SUCCESS);
				}
			
			else
				response.sendRedirect(Pages.ADD_BOOK_FAILURE);
			
		}
		
		catch(Exception e)
		{
			response.sendRedirect(Pages.ADD_BOOK_FAILURE);
		}
	}

	else
	{
		response.sendRedirect(Pages.ADD_BOOK_FAILURE);
	}
%>