<%@page import="Beans.Book"%>
<%@page import="MVC.Model"%>
<%
	if (request.getParameter("Book") != null) {

		Book b = Model.getInstance().getBookDetails(request.getParameter("Book"));
		if (b != null) {
%>
<div class="table-responsive">
	<table class="table text-center table-striped table-bordered">
		<tr>
			<td>Book ID</td>
			<td><%=b.getId()%></td>
		</tr>
		<tr>
			<td>Book Title</td>
			<td><%=b.getTitle()%></td>
		</tr>
		<tr>
			<td>Book Author</td>
			<td><%=b.getAuthor()%></td>
		</tr>
		<tr>
			<td>Book Description</td>
			<td><%=b.getDescription()%></td>
		</tr>
		<tr>
			<td>Copies Available</td>
			<td><%=b.getCopies_available()%></td>
		</tr>
		<tr>
			<td>Section</td>
			<td><%=b.getSection()%></td>
		</tr>
		<tr>
			<td>Shelf</td>
			<td><%=b.getShelf()%></td>
		</tr>
		<tr>
			<td>Tags</td>
			<td><%=b.getTags()%></td>
		</tr>
		<tr>
			<td>Cover</td>
			<td><img src=<%="Book_Photos\\" + b.getPhoto_loc()%>
				style="width: 15vw; height: 25vh; object-fit: cover;"></td>
		</tr>
	</table>
</div>

<%
	}

		else {
%>
<div class="container text-center">
	<h3 class="text-info">No book found</h3>
</div>
<%
	}

	}
%>