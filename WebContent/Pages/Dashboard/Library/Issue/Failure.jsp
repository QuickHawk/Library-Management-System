<%@page import="DB.Error"%>
<div class="container">
	<div class="page-header text-center text-danger">
		<h2>
			Book Issue Failed <span class="glyphicon glyphicon-remove">
			</span>
		</h2>
	</div>
	<p class="page-content text-center text-info">Error : <%=Error.ISSUE_ERROR_MESSAGE[Integer.parseInt(request.getParameter("Error"))] %> </p>
</div>
