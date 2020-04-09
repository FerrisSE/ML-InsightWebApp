$(document).ready(function(){

	listArticles();
});

//Client side API call using AJAX
function listArticles(){
	
	$.ajax({
		url: "../WekaInsightAPI/rest/articles/list/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	$.each(response, function(key, value) {
    		
    		var lstResults = "<tr><td>"+value.articleID+"</td><td>"+value.articleAuthorID+"</td><td>"+value.articleTitle+"</td><td>"+value.articleContent+"</td></tr>";
       		
    		document.getElementById('postBody').innerHTML += lstResults;
    	});
	});
}	
function addArticle(){
	var articleTitle = $("#articleTitle").val();
	var categoryID = $("#categoryID").val();
	var articleAuthorID = $("#articleAuthorID").val();
	var articleContent = $("#articleContent").val();
	
	var parms = { articleTitle:articleTitle, categoryID:categoryID, articleAuthorID:articleAuthorID, articleContent:articleContent}
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/articles/add/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	alert(response.message);
	});
}	