<div class="container">
	<div class="page-header text-center text-success">
		<h2>
			Book Modification Successfully <span
				class="glyphicon glyphicon-check"> </span>
		</h2>
	</div>
	<p class="page-content text-center">Book values have been modified
	</p>
	<div id="book_content">
		<button onclick="getData('get_book.go?Book=<%=request.getParameter("Book") %>', 'book_content')" class="btn btn-info" type="button"> View Book </button>
	</div>
</div>
