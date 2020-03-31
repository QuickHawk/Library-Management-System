<%@page import="Beans.Book"%>
<%@page import="MVC.Model"%>
<%
	if (request.getParameter("Book") != null) {

		Book b = Model.getInstance().getBookDetails(request.getParameter("Book"));
		
		if(b != null)
		{
%>
<div class="container" style="margin-top: 30px;">
	<form id="form" method="post" enctype="multipart/form-data"
		class="form-horizontal">
		<div class="form-group">
			<label for="title" class="control-label col-sm-2"> Book Title
			</label>
			<div class="col-sm-10">
				<input id="title" name="title" type="text" class="form-control" value=<%="'" + b.getTitle() + "'" %>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="author" class="control-label col-sm-2"> Book
				Author </label>
			<div class="col-sm-10">
				<input id="author" name="author" type="text" class="form-control" value=<%="'" + b.getAuthor() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="desc" class="control-label col-sm-2"> Book
				Description </label>
			<div class="col-sm-10">
				<textarea id="desc" name="desc" class="form-control" ><%="" + b.getDescription() + ""%></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="avail" class="control-label col-sm-2"> No of
				Copies Available </label>
			<div class="col-sm-10">
				<input id="avail" name="avail" type="number" class="form-control" value=<%="'" + b.getCopies_available() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="cover" class="control-label col-sm-2"> Book Cover
			</label>
			<div class="col-sm-10">
				<input id="cover" name="cover" type="file" class="form-control" value=<%="'" + b.getPhoto_loc() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="section" class="control-label col-sm-2"> Which
				Section? </label>
			<div class="col-sm-10">
				<input id="section" name="section" type="text" class="form-control" value=<%="'" + b.getSection() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="shelf" class="control-label col-sm-2"> Which
				Shelf? </label>
			<div class="col-sm-10">
				<input id="shelf" name="shelf" type="number" class="form-control" value=<%="'" + b.getShelf() + "'"%>
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="tags" class="control-label col-sm-2"> Book Tags </label>
			<div class="col-sm-10">
				<input id="tags" name="tags" type="text" class="form-control" value=<%="'" + b.getTags() + "'"%>
					required />
			</div>
		</div>
		<div class="text-center">
			<button class="btn btn-warning" type="button"
				onclick="getData('modify_book_validate.go', 'content')">Modify Book</button>
		</div>
	</form>
</div>

<%
	}

	else
	{
		%>
		
		<div class="container text-center">
			<h3 class="text-info"> No book found </h3>
		</div>
		
		<%
	}
}
%>