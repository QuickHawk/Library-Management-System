<div class="container">
	<div class="page-header text-primary">
		<h2>Add Patron</h2>
		<p class="text-info">Provide patron details</p>
	</div>
	<form action='add_book_validate.go' id="form" method="post"
		class="form-horizontal">
		<div class="form-group">
			<label for="id" class="control-label col-sm-2"> Patron ID </label>
			<div class="col-sm-10">
				<input id="id" name="id" type="text" class="form-control" required />
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-2"> Patron Name
			</label>
			<div class="col-sm-10">
				<input id="name" name="name" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="control-label col-sm-2"> Patron
				E-mail </label>
			<div class="col-sm-10">
				<input id="email" name="email" type="email" class="form-control"
					required />
			</div>
		</div>
		<div class="form-group">
			<label for="phno" class="control-label col-sm-2"> Patron
				Phone No </label>
			<div class="col-sm-10">
				<input id="phno" name="phno" type="text" class="form-control"
					required />
			</div>
		</div>
		<div class="text-center">
			<button class="btn btn-primary" type="button"
				onclick="getData('add_patron_validate.go', 'content')">Submit</button>
		</div>
	</form>
</div>