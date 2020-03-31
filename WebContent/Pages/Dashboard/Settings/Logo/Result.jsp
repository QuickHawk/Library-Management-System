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
		String fileLocation = request.getServletContext().getInitParameter("Logo Location");
		
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
		String logo = Model.getInstance().getLogo(fileLocation);
		for(FileItem item : multiparts)
		{
			if(item.getFieldName().equals("logo"))
				logo = item.getString();
		}
			
		Model.getInstance().setLogo(logo, fileLocation);
		out.println("true logo");
	}
	
	catch(Exception e)
	{
		out.println("false logo");
	}
	
}
else
	out.println("false logo");
%>