window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

var r = window.SpeechRecognition;
var rec = new r();

rec.onresult = function(e) {
	var searchResult = e.results[e.resultIndex][0].transcript;
    document.getElementById("searchInput").value = searchResult;
    
    console.log(searchResult);
    SearchBookCards(searchResult);
}

rec.continuous = true;

function vSearch(button) {

	if(typeof rec === "undefined")
		alert("Voice Search is currently supported only on Google Chrome"); 
	
	rec.start();
    button.disabled = true;

    setTimeout(() => {
    	rec.stop();
        button.disabled = false;
     }, 4000);
}