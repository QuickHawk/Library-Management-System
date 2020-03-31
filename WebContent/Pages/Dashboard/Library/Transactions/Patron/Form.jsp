<div class="container">
	<div class="page-header text-primary">
		<h2>Patron Transactions</h2>
		<p class="text-info">Provide Patron ID to list the Patron's active transactions </p>
	</div>
	<div class="form">
		<form id="form" class="">
			<div class="form-group">
				<div class="input-group">
					<input name="Patron" class="form-control" placeholder="Patron ID">
					<div class="input-group-btn">
						<button type="button" class="btn btn-primary" onclick="XHRHelper('patron_transactions.go?Patron=' + $('#form input')[0].value, null, display, 'transaction_content')"> Search </button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="transaction_content">
		
	</div>
</div>