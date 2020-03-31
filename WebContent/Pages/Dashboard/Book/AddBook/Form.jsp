<div class="container">

	<div class="page-header text-primary">
		<h2>Add Book</h2>
		<p class="text-info">Provide book details</p>
	</div>

	<form action='add_book_validate.go' id="form" method="post"
		enctype="multipart/form-data" class="form-horizontal">
		<div class="form-group">
			<label for="title" class="control-label col-sm-2"> Book Title
			</label>
			<div class="col-sm-10">
				<input id="title" name="title" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="author" class="control-label col-sm-2"> Book
				Author </label>
			<div class="col-sm-10">
				<input id="author" name="author" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="desc" class="control-label col-sm-2"> Book
				Description </label>
			<div class="col-sm-10">
				<textarea id="desc" name="desc" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="avail" class="control-label col-sm-2"> No of
				Copies Available </label>
			<div class="col-sm-10">
				<input id="avail" name="avail" type="number" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="cover" class="control-label col-sm-2"> Book Cover
			</label>
			<div class="col-sm-10">
				<input id="cover" name="cover" type="file" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="section" class="control-label col-sm-2"> Which
				Section? </label>
			<div class="col-sm-10">
				<input id="section" name="section" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="shelf" class="control-label col-sm-2"> Which
				Shelf? </label>
			<div class="col-sm-10">
				<input id="shelf" name="shelf" type="number" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="tags" class="control-label col-sm-2"> Book Tags </label>
			<div class="col-sm-10">
				<input id="tags" name="tags" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="text-center">
			<button class="btn btn-primary" type="button"
				onclick="getData('add_book_validate.go', 'content')">Submit</button>
		</div>
	</form>
</div>