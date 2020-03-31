<div class="container">
	<form class="form">
		<div class="form-group">
			<input id="libID" name="id" class="form-control"
				placeholder="Librarian ID" />
		</div>
		<div class="form-group">
			<input id="libName" name="name" class="form-control"
				placeholder="Librarian Name" />
		</div>
		<div class="form-group">
			<input id="libPass" name="pass" type="password" class="form-control"
				placeholder="Librarian Password" />
		</div>
		<div class="form-group">
			<button class="btn btn-warning" type="button"
				onclick="getData('settings_change_librarian.do', 'settings_content', settings)">
				Change</button>
		</div>
	</form>
</div>