<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="MVC.Model"%>
<%
	String Book_ID = null;

	if(ServletFileUpload.isMultipartContent(request))
	{
		try{
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
			for(FileItem item : multiparts)
			{
				if(item.isFormField())
					if(item.getFieldName().equals("Book"))
						{
							Book_ID = item.getString();
							break;
						}
			}
		}
		catch(Exception e)
		{
			
		}
	}
		
	if(Book_ID == null)
		response.sendRedirect("delete_book_failure.go");
	
	else
	{
		if(Model.getInstance().deleteBook(Book_ID))
			response.sendRedirect("delete_book_success.go");
		
		else
			response.sendRedirect("delete_book_failure.go");
	}
%>