<%@page import="Beans.*"%>
<%@page import="MVC.*"%>
<%
	if (request.getParameter("Patron") != null) {

		Patron b = Model.getInstance().getPatronDetails(request.getParameter("Patron"));
		if (b != null) {
%>
<div class="container-fluid">
	<form action='add_patron_validate.go' id="form" method="post"
		class="form-horizontal">
		<div class="form-group">
			<label for="name" class="control-label col-sm-2"> Patron Name
			</label>
			<div class="col-sm-10">
				<input id="name" name="name" type="text" class="form-control" value=<%="'" + b.getName() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="control-label col-sm-2"> Patron
				E-mail </label>
			<div class="col-sm-10">
				<input id="email" name="email" type="email" class="form-control" value=<%="'" + b.getEmail() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="phno" class="control-label col-sm-2"> Patron
				Phone No : </label>
			<div class="col-sm-10">
				<input id="phno" name="phno" type="text" class="form-control" value=<%="'" + b.getPhno() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="amount" class="control-label col-sm-2"> Patron
				Due Amount : </label>
			<div class="col-sm-10">
				<input id="amount" name="amount" type="text" class="form-control" value=<%="'" + b.getDue_amount() + "'"%>
					required />
			</div>
		</div>
		<div class="text-center">
			<button class="btn btn-primary" type="button"
				onclick="getData('modify_patron_validate.go', 'content')">Submit</button>
		</div>
	</form>
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