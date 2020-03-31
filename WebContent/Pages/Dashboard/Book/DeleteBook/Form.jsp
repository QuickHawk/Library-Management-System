<div class="container">
	<div class="page-header text-primary">
		<h2>Delete Book</h2>
		<p class="text-info">Search the book you want to delete</p>
	</div>
	<div class="form">
		<form id="form" class="">
			<div class="form-group">
				<div class="input-group">
					<input name="Book" class="form-control" placeholder="Book ID">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" onclick="XHRHelper('get_book.go?Book=' + $('#form input')[0].value, null, _delete, 'book_content')">Search</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="book_content">
		
	</div>
</div>