<!DOCTYPE html>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.FileReader"%>
<%@page import="Beans.Book"%>
<%@page import="Beans.News"%>
<%@page import="java.util.List"%>
<%@page import="MVC.Model"%>
<%
	final int MAX_DISPLAY_BOOKS = 4;
%>
<html lang="en">

<head>
<title>Home</title>
<script src="Utilities/js/VoiceSearch.js"></script>
<script src="Utilities/js/XHR_Util.js" type="module"></script>
<script src="Utilities/js/BookCard.js"></script>
<script src="Utilities/bootstrap/js/jquery.js"></script>
<script src="Utilities/bootstrap/dist/js/bootstrap.js"></script>
<link rel="stylesheet" href="Utilities/bootstrap/dist/css/bootstrap.css" />
</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"> <%=Model.getInstance().getLogo(request.getServletContext().getRealPath("Documents/Logo.txt")) %> </a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#" class="text-center" data-toggle="modal"
						data-target="#search">
						<span class="glyphicon glyphicon-search"></span> Search Books
					</a>
				</li>
				<li>
					<a href="#" class="text-center" data-toggle="modal"
						data-target="#login-form">
						<span class="glyphicon glyphicon-log-in"></span> Login
					</a>
				</li>
			</ul>
		</div>
	</nav>

	<div id="search" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
					<h4 class="modal-title">Search Books</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="input-group">
							<input type="text" id="searchInput" class="form-control"
								placeholder="Book Name, Author Name, Tag Name......."
								onchange="SearchBookCards(this.value)" />
							<div class="input-group-btn">
								<button type="button" class="btn btn-default"
									onclick="vSearch(this)">
									<span class="glyphicon glyphicon-ice-lolly"></span>
								</button>
							</div>
						</div>
						<div class="container-fluid" id="book_card_content" style="margin-top: 15px; overflow-y: scroll; height: 75vh;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="login-form" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="login.do" method="post">
						<div class="form-group">
							<label for="username"> Username : </label> <input type="text"
								id="username" name="username" class="form-control"
								placeholder="Enter Username......" />
						</div>
						<div class="form-group">
							<label for="password"> Password : </label> <input type="password"
								id="password" name="password" class="form-control"
								placeholder="Enter Password....." />
						</div>
						<button type="submit"
							class="btn btn-default btn-primary btn-block">
							<span class="glyphicon glyphicon-log-in"></span> Login
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid text-center" style='margin-top: 60px;'>
		<div class="row">
			<div class="col-md-3">
				<div class="container-fluid">
					<h3>About Us</h3>
					<hr />
					<p style="font-size: large;">
						<%
							out.println(Model.getInstance().getAbout(getServletContext().getRealPath("Documents/About.txt")));
						%>
					</p>
				</div>
			</div>
			<div class="col-md-9">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<%
							List<News> news = Model.getInstance().fetchTopNews();

							if (news != null)
								for (int i = 0; i < news.size(); i++) {
									String outHTML = "";

									outHTML += "<div class='item" + (i == 0 ? " active" : "") + "'>";

									outHTML += "<a href='" + news.get(i).getUrl() + "'>";

									outHTML += "<img src='" + news.get(i).getUrlToImage()
											+ "' style='width: 100%; height: 450px; object-fit: cover; filter: brightness(0.5);'>";

									outHTML += "</a>";

									outHTML += "<div class='carousel-caption'>";

									outHTML += "<h3>" + news.get(i).getNewsTitle() + "</h3>";
									outHTML += "<p>" + news.get(i).getNewsDescription() + "</p>";

									outHTML += "</div>";

									outHTML += "</div>";

									out.println(outHTML);
								}
						%>
					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="page-header text-info">
				<h4>New Additions :- </h4>
			</div>
			<%
				List<Book> books = Model.getInstance().searchBooks("");

				if(books.size() != 0)
				for (int i = 0; i < MAX_DISPLAY_BOOKS && i < books.size(); i++) {
					String outHTML = "";

					outHTML += "<div class='col-md-3'>";

					outHTML += "<div class='panel panel-default'>";

					outHTML += "<div class='panel-body'>";

					outHTML += "<img src='Book_Photos\\" + books.get(i).getPhoto_loc()
							+ "' style='width: 100%; height: 25vh; object-fit: cover;'>";

					outHTML += "</div>";

					outHTML += "<div class='panel-footer'>";

					outHTML += books.get(i).getTitle();

					outHTML += "</div>";

					outHTML += "</div>";

					outHTML += "</div>";

					out.println(outHTML);
				}
				
				else
				{
					out.println("<div class='text-info'><h3> No Books Exist </h3></div>");
				}
			%>

		</div>
	</div>
</body>

</html>