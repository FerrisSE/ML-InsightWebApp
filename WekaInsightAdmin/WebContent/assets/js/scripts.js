$(document).ready(function(){

	//listArticles();
	
	listArticles();
	
	view = getQueryStringVariable('view');
	
	if(view == 'articleedit'){
		articleID = getQueryStringVariable('edit');
		getArticle(articleID);
	}
	if(view == 'navedit'){
		navigationID = getQueryStringVariable('edit');
		getNavigation(navigationID);
	}
	if(view == 'catedit'){
		categoryID = getQueryStringVariable('edit');
		getCategory(categoryID);
	}
	if(view == 'useredit'){
		userID = getQueryStringVariable('edit');
		getUser(userID);
	}
});

function listResult(){
	
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/results/",
		type: 'GET',
		dataType : "text",
        contentType: "text/plain",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
	
//    		var lstResults = "<tr><td><a href ='./index.jsp?view=articleedit&edit="+value.attribute1+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a>"+
//    		"<a href = '#' onclick=deleteCategoryModal('"+value.attribute1+"','"+encodeURIComponent(value.attribute1)+"') data-toggle='tooltip' title='Delete'><span class='fa fa-trash-alt' aria-hidden='true'></span><span class='sr-only'>Delete</span></a></td>" +
//            "<td>"+value.attribute1+"</td><td>"+value.attribute2+"</td><td>"+value.attribute3+"</td><td>"+value.attribute4+"</td><td>"+value.attribute5+"</td></tr>";
//    		
    		var lstResults = "<a>"+response+"</a>"
    		
    		if($("#postBody").text()){
    		document.getElementById('postBody').innerHTML += lstResults;
    		}
	});
}

//Client side API call using AJAX
//function listArticles(){
//	
//	$.ajax({
//		url: "../WekaInsightAPIs/rest/articles/list/",
//		type: 'GET',
//		dataType : "json",
//        contentType: "application/json",
//	}).fail(function(response) {
//		console.log(JSON.stringify(response));
//
//    }).done(function(response){
//
//    	$.each(response, function(key, value) {
//    /*		
//    		var lstResults = "<tr><td>"+value.testID+"</td><td>"+value.userID+"</td><td>"+value.testTitle+"</td><td>"+value.testResult+"</td></tr>";
//    		//var lstResults = "<tr><td>"+value.testResult+"</td></tr>";
//       	*/	
//    		
//
//	
//    		document.getElementById('postBody').innerHTML += lstResults;
//    	});
//	});
//}	
/*
function getArticle(){
	var testTitle = $("#testTitle").val();
//	var categoryID = $("#categoryID").val();
//	var userID = $("#userID").val();
	var testResult = $("#testResult").val();
	
//	var parms = { testTitle:testTitle, categoryID:categoryID, userID:userID, testResult:testResult}
	var parms = { testTitle:testTitle, testResult:testResult}
	var result = ClassifyInstance.getTestResult;
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/users/",
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
*/
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