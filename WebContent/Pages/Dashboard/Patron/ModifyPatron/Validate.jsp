<%@page import="MVC.*"%>
<%@page import="Beans.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.*"%>

<%
	Patron p = new Patron();

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
						case "Patron":	p.setId(value);
										break;
										
						case "name": 	p.setName(value);
										break;
										
						case "email":	p.setEmail(value);
										break;
										
						case "phno":	p.setPhno(value);
										break;
										
						case "amount": 	p.setDue_amount(Integer.parseInt(value));
										break;
									
						default: 		break;
										
						
					}
				}
			}
			
			System.out.println(p);
			
			if(Model.getInstance().modifyPatron(p))
				response.sendRedirect(Pages.MODIFY_PATRON_SUCCESS + "?Patron=" + p.getId());
				
			
			else
				response.sendRedirect(Pages.MODIFY_PATRON_FAILURE);
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect(Pages.MODIFY_PATRON_FAILURE);
		}
	}

	else
	{
		response.sendRedirect(Pages.MODIFY_PATRON_FAILURE);
	}
%>