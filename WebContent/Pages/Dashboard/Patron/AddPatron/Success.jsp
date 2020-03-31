<%@page import="MVC.Pages"%>
<div class="container">
	<div class="page-header text-center text-success">
		<h2>
			Patron Added Successfully <span class="glyphicon glyphicon-check">
			</span>
		</h2>
	</div>
	<p class="page-content text-center">Patron is been added to DB</p>
	<div id="patron_content">
		<button onclick="getData('get_patron.go?Patron=<%=request.getParameter("Patron") %>', 'patron_content')" class="btn btn-info" type="button"> View Patron </button>
	</div>
</div>