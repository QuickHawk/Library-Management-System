function XHRHelper(url, data, callback, reflect_div_id)
{
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(e)
	{
		if(this.readyState == 4 && this.status == 200)
			{
				callback(this.responseText, reflect_div_id);
			}
		
	};
	
	
	xhr.open('POST', url);
	xhr.send(data);
}

function display(response, div_id)
{
	document.getElementById(div_id).innerHTML = response;
}

function modify(response, div_id)
{
	display(response, div_id);
	$('#form input[id="id"]').prop('disabled', 'true');
}

function irr(irr_type)
{
	var book_id = $('form input[id="book"]')[0].value;
	var patron_id = $('form input[id="patron"]')[0].value;
	
	var name_type = irr_type.charAt(0).toUpperCase() + irr_type.slice(1);
	
	var url = irr_type + "_validate.go?Book=" + book_id + "&Patron=" + patron_id;
	
	getData('get_book.go?Book=' + book_id, 'book_content');
	getData('get_patron.go?Patron=' + patron_id,'patron_content');
	
	$('div[id="content"]')[0].innerHTML += "<button class='btn btn-primary' id='irr' type='button' onclick='getData(\"" + url + "\", \"content\")'>" + name_type + "</button>";
	
	setTimeout(function(){if($('#book_content table')[0] === undefined || $('#patron_content table')[0] === undefined)
		$('#irr').prop('disabled', 'true')}, 500);
}

function _delete(response, div_id)
{
	display(response, div_id);
//	console.log(response);
	var d_type;
	
//	console.log(response);
	
	if(response.includes("Book"))			d_type = "book";
	else if(response.includes("Patron"))	d_type = "patron";
	
	if(!response.includes("No " + d_type + " found"))
		document.getElementById(div_id).innerHTML += 
			"<button type='button' onclick='getData(\"delete_" + d_type + "_validate.go\", \"content\")' class='flow-control btn btn-danger'> Delete </button>";
}

function getData(url, reflect_div_id, callback = display)
{
	console.log(url);
	
	var formData = new FormData();
	
	var inputs = document.querySelectorAll("form  input,form  textarea");
	console.log(inputs);
	
	if(inputs != null)
	for(i=0;i<inputs.length;i++)
		{
			if(inputs[i].name !== "cover")
				formData.append(inputs[i].name, inputs[i].value);
			
			else
				formData.append("cover", document.getElementById("cover").files[0]);
							
		}
	
	XHRHelper(url, formData, callback, reflect_div_id);
	
}

function settings(response, div_id)
{
	var content = document.getElementById(div_id);
	var type;
	
	if(response.includes("logo"))				type = "Logo";
	else if(response.includes("about"))			type = "About";
	else if(response.includes("librarian")) 	type = "Librarian";
	
	if(response.includes("true"))
		content.innerHTML = "<div class='alert alert-success'> <strong> Success! </strong> " + type + " changed successfully </div>";
	
	else
		content.innerHTML = "<div class='alert alert-danger'> <strong> Failure! </strong> " + type + " Couldn't be changed </div>";
}