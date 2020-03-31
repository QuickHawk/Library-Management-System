<%@page import="MVC.Model"%>
<div class="container">
	<div class="page-header text-center text-success">
		<h2> Settings <span class="glyphicon glyphicon-cog"></span></h2>
	</div>
	<div class="container" id="settings_content">
		<div class="row"><button class="btn btn-block btn-lg" type="button" onclick="getData('settings_logo.do', 'settings_content')"> Change Logo </button></div>
		<hr/>
		<div class="row"><button class="btn btn-block btn-lg" type="button" onclick="getData('settings_about.do', 'settings_content')"> Change About </button></div>
		<hr/>
		<div class="row"><button class="btn btn-block btn-lg" type="button" onclick="getData('settings_librarian.do', 'settings_content')"> Change Librarian </button></div>
	</div>
</div>