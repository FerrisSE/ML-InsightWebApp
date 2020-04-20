$(document).ready(function(){

	listArticles();
});

//Client side API call using AJAX
function listArticles(){
	
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/list/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	$.each(response, function(key, value) {
    		
    		var lstResults = "<tr><td>"+value.testID+"</td><td>"+value.userID+"</td><td>"+value.testTitle+"</td><td>"+value.testResult+"</td></tr>";
    		//var lstResults = "<tr><td>"+value.testResult+"</td></tr>";
       		
    		

	
    		document.getElementById('postBody').innerHTML += lstResults;
    	});
	});
}	

function getArticle(){
	var testTitle = $("#testTitle").val();
//	var categoryID = $("#categoryID").val();
//	var userID = $("#userID").val();
	var testResult = $("#testResult").val();
	
//	var parms = { testTitle:testTitle, categoryID:categoryID, userID:userID, testResult:testResult}
	var parms = { testTitle:testTitle, testResult:testResult}
	var result = ClassifyInstance.getTestResult;
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/result/",
	//	type: 'GET',
		dataType : "JSON",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    //	$("#results").text(LoadSaveData());
    	alert(response.message);
	});
}

function postFile(){
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/result/",
		type: 'POST',
		dataType : "text",
        contentType: "text/plain",
	}).fail(function(response) {
		alert("There was a failure")
		console.log(JSON.stringify(response));

    }).done(function(response){
    	alert("Starting to get response");
    	$("#testResult").text(response);
    	console.log(response);
    	alert("Response received");

	});
}

function getResult(){
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/result/",
		type: 'GET',
		dataType : "text",
        contentType: "text/plain",
	}).fail(function(response) {
		alert("There was a failure")
		console.log(JSON.stringify(response));

    }).done(function(response){
    	alert("Starting to get response");
    	$("#testResult").text(response);
    	console.log(response);
    	alert("Response received");

	});
}