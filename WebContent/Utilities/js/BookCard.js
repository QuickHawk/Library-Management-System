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


function SearchBookCards(search)
{
	XHRHelper('search_book_data.go?Search=' + search, null, MakeCards, 'book_card_content');
}

function MakeCards(response, div_id)
{
	var books = JSON.parse(response)["Books"];
	
	var content_div = document.getElementById(div_id);
	content_div.innerHTML = "";
	
	var row; 
		
	for(i=0;i<books.length;i++)
		{
			if((i % 4) == 0)
				{
					if(row !== undefined)
						content_div.appendChild(row);
					
					row = document.createElement('div');
					row.className = 'row';
				}
			
			var col = document.createElement('div');
//			col.className = 'col-sm-3';
				
				var panel = document.createElement('div');
				panel.className = 'panel panel-info';
				
					var panel_heading = document.createElement('div');
					panel_heading.className = 'panel-heading';
					panel_heading.innerHTML = "Book ID : " + books[i]["id"];
				
					panel.appendChild(panel_heading);
					
					var panel_body = document.createElement('div');
					panel_body.className = "panel-body";
					
						var media = document.createElement('div');
						media.className = 'media';
						
							var media_pic = document.createElement('div');
							media_pic.className = "media-left media-middle";
							
								var img = document.createElement('img');
								img.src = 'Book_Photos\\' + books[i]['photo_loc'];
								img.style = 'object-fit: cover; height: 200px; width: 150px;';
								
								media_pic.appendChild(img);
							
							media.appendChild(media_pic);
							
							var media_body = document.createElement('div');
							media_body.className = 'media-body';
							
							media_body.innerHTML = 	"Title : " + books[i]['title'] + "<br//>";
							media_body.innerHTML += "Author : " + books[i]['author'] + "<br/>";
							media_body.innerHTML += "Copies Available : " + books[i]['copies_available'] + "<br/>";
							media_body.innerHTML += "Section : " + books[i]['section'] + "<br/>";
							media_body.innerHTML += "Shelf : " + books[i]['shelf'] + "<br/>";
							media_body.innerHTML += "Tags : " + books[i]['tags'] + "<br/>";
							
							media.appendChild(media_body);
						
						panel_body.appendChild(media);
					
					panel.appendChild(panel_body);
					
				col.appendChild(panel);
				
			row.appendChild(col);
			
		}
	
	if((books.length % 4) != 0)
		content_div.appendChild(row);
	
	console.log(content_div);
}