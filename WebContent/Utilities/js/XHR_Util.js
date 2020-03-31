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
