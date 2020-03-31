<%@page import="MVC.Model"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%
if(ServletFileUpload.isMultipartContent(request))
{
	try{
		String fileLocation = request.getServletContext().getInitParameter("About Location");
		
		List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
		String about = "";
		for(FileItem item : multiparts)
		{
			if(item.getFieldName().equals("about"))
				about = item.getString();
		}
			
		Model.getInstance().changeAbout(about, fileLocation);
		out.println("true about");
	}
	
	catch(Exception e)
	{
		out.println("false about");
	}
	
}
else
	out.println("false about");
%>