<%@page import="java.io.File"%>
<%@page import="MVC.Pages"%>
<%@page import="Beans.Book"%>
<%
	if (session.getAttribute("Book") == null)
		response.sendRedirect("add_book_failure.go");

	else {
		Book b = (Book) session.getAttribute("Book");
%>
<div class="container">
	<div class="page-header text-center text-success">
		<h2>
			Book Added Successfully <span class="glyphicon glyphicon-check">
			</span>
		</h2>
	</div>
	<p class="page-content text-center">Book is been added to DB</p>
	<div id="book_content">
		<button class="btn btn-info" type="button" onclick="getData('get_book_session.go', 'book_content')"> View Book </button>
	</div>
</div>
<%
	}
%>