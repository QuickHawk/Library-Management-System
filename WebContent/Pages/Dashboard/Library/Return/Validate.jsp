<%@page import="MVC.Model"%>
<%
	String book_id = request.getParameter("Book");
	String patron_id = request.getParameter("Patron");
	
	if(book_id == null || patron_id == null)
		response.sendRedirect("return_failure.go?Error=2");
	
	else{
		
		int error_id = Model.getInstance().returnBook(book_id, patron_id);
		if(error_id == 0)
			response.sendRedirect("return_success.go");
		
		else
			response.sendRedirect("return_failure.go?Error=" + error_id);
	}
%>