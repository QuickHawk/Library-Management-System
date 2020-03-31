<%@page import="MVC.Model"%>
<%
	String book_id = request.getParameter("Book");
	String patron_id = request.getParameter("Patron");
	
	if(book_id == null || patron_id == null)
		response.sendRedirect("issue_failure.go?Error=4");
	
	else{
		
		int error_id = Model.getInstance().issueBook(book_id, patron_id);
		if(error_id == 0)
			response.sendRedirect("issue_success.go");
		
		else
			response.sendRedirect("issue_failure.go?Error=" + error_id);
	}
%>