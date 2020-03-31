<div class="container">
	<div class="page-header text-primary">
		<h2>Modify Book</h2>
		<p class="text-info">Search for the book and change the values........</p>
	</div>
	<div class="form">
		<form id="form" class="">
			<div class="form-group">
				<div class="input-group">
					<input name="Book" id="id" class="form-control" placeholder="Book ID">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" onclick="XHRHelper('get_book_modify.go?Book=' + $('#form input')[0].value, null, modify, 'book_content')">Search</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="book_content">
		
	</div>
</div>