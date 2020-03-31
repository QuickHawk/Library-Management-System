<%@page import="MVC.Model"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%
if(ServletFileUpload.isMultipartContent(request))
{
	try{
		
		String id = "";
		String password = "";
		String name = "";
		
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
		for(FileItem item : multiparts)
		{
			String value = item.getString();
			
			switch(item.getFieldName())
			{
				case "id" :			id = new String(value);			break;
				case "name" : 		name = new String(value); 		break;
				case "pass" : 		password = new String(value); 	break;
			}
		}
			
		boolean b = Model.getInstance().changeLibrarian(id, name, password);
		out.println(b + " librarian");
	}
	
	catch(Exception e)
	{
		out.println("false librarian");
	}
	
}
else
	out.println("false librarian");
%>