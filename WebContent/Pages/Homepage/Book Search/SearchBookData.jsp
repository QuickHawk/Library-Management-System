<%@page import="MVC.Model"%>
<%
	response.setContentType("application/json");
	out.println("{\"Books\" : " + Model.getInstance().searchBooks(request.getParameter("Search")) + " } ");
%>