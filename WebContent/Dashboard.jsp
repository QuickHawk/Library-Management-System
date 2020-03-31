<%@page import="MVC.Model"%>
<%@page import="Beans.Librarian"%>
<%
	if(session.getAttribute("LibUser") == null)
		response.sendRedirect("home.go");
	else
	{
		String name = ((Librarian)session.getAttribute("LibUser")).getName();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Dashboard</title>
    <script src="Utilities/bootstrap/js/jquery.js"></script>
    <script src="Utilities/js/DashboardController.js"></script>
    <script src="Utilities/bootstrap/dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="Utilities/bootstrap/dist/css/bootstrap.css">
</head>

<body style="background-image: url('6.jpg'); background-repeat: no-repeat; background-size: cover; height: 93vh; width: 97vw;">

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="#" class="navbar-brand"> <%=Model.getInstance().getLogo(request.getServletContext().getRealPath("Logo.txt")) %> </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="dropdown text-center">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Book Activities <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="text-center">
                            <a href="#" onclick="getData('add_book.go', 'content')">Add Book</a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('modify_book.go', 'content')">Modify Book</a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('delete_book.go', 'content')">Remove Book</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown  text-center">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Patron Activities <span class="caret"></span></a>
                    <ul class="dropdown-menu ">
                        <li class="text-center">
                            <a href="#" onclick="getData('add_patron.go', 'content')">Add Patron</a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('modify_patron.go', 'content')">Modify Patron</a>
                        </li>
                        <li class="text-center">
                            <a href="#"  onclick="getData('delete_patron.go', 'content')">Remove Patron</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown  text-center">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Library Activities <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="text-center">
                            <a href="#" onclick="getData('issue.go', 'content')">Issue</a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('renew.go', 'content')">Renew</a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('return.go', 'content')">Return</a>
                        </li>
                        <li class="divider"></li>
                        <li class="text-center">
                            <a href="#" onclick="getData('patron_transactions_form.go', 'content')"> View Patron Transactions </a>
                        </li>
                        <li class="text-center">
                            <a href="#" onclick="getData('active_transactions.go', 'content')"> View Active Transactions </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="navbar-text text-center">
                    Welcome, <%=name %>
                </li>
                <li class="text-center">
                    <a href="#" onclick="getData('settings.go', 'content')"><span class="glyphicon glyphicon-cog"></span> Settings </a>
                </li>
                <li class="text-center">
                    <a href="logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid text-center" id="content" style="margin-top: 50px;">
        <h2>Welcome, <%=name %></h2><br/>Perform an action using the navigation bar
    </div>

</body>

</html>

<%
	}
%>