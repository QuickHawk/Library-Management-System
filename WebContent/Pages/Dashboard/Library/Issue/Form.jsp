<div class="container">
	<div class="page-header text-primary">
		<h2>Issue</h2>
		<p class="text-info">Provide Book ID and Patron ID</p>
	</div>
	<form>
		<div class="form-group">
			<input id="book" type="text" class="form-control"
				placeholder="Book ID">
		</div>
		<div class="form-group">
			<input id="patron" type="text" class="form-control"
				placeholder="Patron ID">
		</div>
		<div class="form-group">
			<button class="btn btn-primary" type="button" onclick="irr('issue')">
				Search Book and Patron</button>
		</div>
	</form>
</div>
<div class="container" id="content">
	<div id="book_content" class="container-fluid col-md-6"></div>
	<div id="patron_content" class="container-fluid col-md-6"></div>
</div>