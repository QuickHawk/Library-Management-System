<%@page import="Beans.*"%>
<%@page import="MVC.*"%>
<%
	if (request.getParameter("Patron") != null) {

		Patron b = Model.getInstance().getPatronDetails(request.getParameter("Patron"));
		if (b != null) {
%>
<div class="table-responsive">
	<table class="table text-center table-striped table-bordered">
		<tr>
			<td>Patron ID</td>
			<td><%=b.getId()%></td>
		</tr>
		<tr>
			<td>Patron Name</td>
			<td><%=b.getName()%></td>
		</tr>
		<tr>
			<td>Patron E-mail</td>
			<td><%=b.getEmail()%></td>
		</tr>
		<tr>
			<td>Patron Phone Number</td>
			<td><%=b.getPhno()%></td>
		</tr>
		<tr>
			<td>Patron Due Amount</td>
			<td><%=b.getDue_amount() %></td>
		</tr>
	</table>
</div>

<%
	}

		else {
%>
<div class="container text-center">
	<h3 class="text-info">No patron found</h3>
</div>
<%
	}

	}
%>