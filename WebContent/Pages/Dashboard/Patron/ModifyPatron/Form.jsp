<div class="container">
	<div class="page-header text-primary">
		<h2>Modify Patron</h2>
		<p class="text-info">Search patron and change the values............</p>
	</div>
	<div class="form">
		<form id="form" class="">
			<div class="form-group">
				<div class="input-group">
					<input name="Patron" id="id" class="form-control" placeholder="Patron ID">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" onclick="XHRHelper('get_patron_modify.go?Patron=' + $('#form input')[0].value, null, modify, 'patron_content')">Search</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="patron_content">
		
	</div>
</div>