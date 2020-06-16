$(document).ready(function(){

	//listDatas();
	//listAttributes();
	
	view = getQueryStringVariable('view');
	
	if(view == 'dataedit'){
		dataID = getQueryStringVariable('edit');
		getData(dataID);
	}
	if(view == 'navedit'){
		attributeID = getQueryStringVariable('edit');
		getNavigation(attributeID);
	}
	if(view == 'catedit'){
		attributeID = getQueryStringVariable('edit');
		getAttribute(attributeID);
	}
	if(view == 'useredit'){
		userID = getQueryStringVariable('edit');
		getUser(userID);
	}
	if(view == 'data'){
		dataID = getQueryStringVariable('dataID');
		getData(dataID);
	}
	if(view == 'datasbycat'){
		attributeID = getQueryStringVariable('attributeID');
		getAttribute(attributeID);
		listDatasByAttribute(attributeID);
	}
});

var getQueryStringVariable = function ( field, url ) {
	var href = url ? url : window.location.href;
	var reg = new RegExp( '[?&]' + field + '=([^&#]*)', 'i' );
	var string = reg.exec(href);
	return string ? string[1] : null;
};


function download_csv(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV FILE
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // We have to create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Make sure that the link is not displayed
    downloadLink.style.display = "none";

    // Add the link to your DOM
    document.body.appendChild(downloadLink);

    // Lanzamos
    downloadLink.click();
}

function export_table_to_csv(html, filename) {
	var csv = [];
	var rows = document.querySelectorAll("table tr");
	
    for (var i = 0; i < rows.length; i++) {
		var row = [], cols = rows[i].querySelectorAll("td, th");
		
        for (var j = 0; j < cols.length; j++) 
            row.push(cols[j].innerText);
        
		csv.push(row.join(","));		
	}

    // Download CSV
    download_csv(csv.join("\n"), filename);
}

document.querySelector("button").addEventListener("click", function () {
    var html = document.querySelector("table").outerHTML;
	export_table_to_csv(html, filename+".csv");
});



function listResult(){
	
	$.ajax({
		url: "../WekaInsightAPIs/rest/datas/results/",
		type: 'GET',
		dataType : "text",
      //  contentType: "text/plain",
	}).fail(function(response) {
		console.log(JSON.stringify(response));
		
    }).done(function(response){
    		alert("classification failed");
//    		var lstResults = "<tr><td><a href ='./index.jsp?view=dataedit&edit="+value.attribute1+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a>"+
//    		"<a href = '#' onclick=deleteAttributeModal('"+value.attribute1+"','"+encodeURIComponent(value.attribute1)+"') data-toggle='tooltip' title='Delete'><span class='fa fa-trash-alt' aria-hidden='true'></span><span class='sr-only'>Delete</span></a></td>" +
//            "<td>"+value.attribute1+"</td><td>"+value.attribute2+"</td><td>"+value.attribute3+"</td><td>"+value.attribute4+"</td><td>"+value.attribute5+"</td></tr>";
//    		
    		var lstResults = "<a>"+response+"</a>"
    		
    		if($("#postBody").text()){
    		document.getElementById('postBody').innerHTML += lstResults;
    		}
	});
}

//Client side API call using AJAX
//function listDatas(){
//	
//	$.ajax({
//		url: "../WekaInsightAPIs/rest/datas/list/",
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
function getData(){
	var testTitle = $("#testTitle").val();
//	var attributeID = $("#attributeID").val();
//	var userID = $("#userID").val();
	var testResult = $("#testResult").val();
	
//	var parms = { testTitle:testTitle, attributeID:attributeID, userID:userID, testResult:testResult}
	var parms = { testTitle:testTitle, testResult:testResult}
	var result = ClassifyInstance.getTestResult;
	$.ajax({
		url: "../WekaInsightAPIs/rest/datas/users/",
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
//function postFile(){
//	$.ajax({
//		url: "../WekaInsightAPIs/rest/datas/result/",
//		type: 'POST',
//		dataType : "text",
//        contentType: "text/plain",
//	}).fail(function(response) {
//		alert("There was a failure")
//		console.log(JSON.stringify(response));
//
//    }).done(function(response){
//    	alert("Starting to get response");
//    	$("#testResult").text(response);
//    	console.log(response);
//    	alert("Response received");
//
//	});
//}

function getResult(){
	$.ajax({
		url: "../WekaInsightAPIs/rest/datas/result/",
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
//
//function listAttributes(){
//
//	$.ajax({
//		url: "../WekaInsightAPIs/rest/attributes/listvisible/",
//		type: 'GET',
//		dataType : "json",
//        contentType: "application/json",
//	}).fail(function(response) {
//
//    }).done(function(response) {
//    	
//    	$.each(response, function(key, value) {
//    		if(value.hasOwnProperty('attributes')){
//    			
//    			attributes = "<li class='nav-item dropdown'><a class='nav-link dropdown-toggle' href='"+value.attributeURL+"' role='button' data-toggle='dropdown'>"+value.attributeName+"</a>";
//    			attributes += "<div class='dropdown-menu'>";
//    			
//    			$.each(value.attributes, function(k, v){
//	    			attributes += "<a class='dropdown-item' href='index.jsp?view=datasbycat&attributeID="+v.attributeID+"'>"+v.attributeName+"</a>";
//    			});
//    	
//    			attributes += "</div></li>";
//    			
//    		}else{
//
//    			attributes = "<li class='nav-item'><a class='nav-link' href='"+value.attributeURL+"'>"+value.attributeName+"</a></li>";
//    		}
//    		$("#attributeUL").append(attributes);
//    	});
//	});
//}

function getAttribute(attributeID){

	$.ajax({
		url: "../WekaInsightAPIs/rest/attributes/list/"+attributeID,
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {

    }).done(function(response) {
    	
		Console.log("attribute: "+attributeID);

    	var heading = "<h1 class='my-4'>"+response.attributeName+"</h1><hr>"+
    		    	"<div class='row'><div><img class='img-responsive img-thumbnail img-rounded artImage' src='./uploads/"+response.attributeImage+"'>"+
    		    	response.attributeContent+"</div></div><hr>";
    		    	
    		    	$("#dataPageHeading").append(heading);

    				Console.log("attribute: "+attributeID);

    	});
}

function listDatasByAttribute(attributeID){

	$.ajax({
		url: "../WekaInsightAPIs/rest/datas/listByAttribute/"+attributeID,
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {

    }).done(function(response) {
    	
    	$.each(response, function(key, value) {
    		console.log("attribute: "+attributeID);

    		
    		
    		var blogPosts = "<div class='card mb-4'>" +
            "<img id='imageId_"+value.dataAuthorID+"' class='card-img-top' src='./uploads/"+value.dataImage+"' alt='Card image cap'>" +
            "<div class='card-body'>" +
              "<h2 class='card-title'>" + value.dataTitle + "</h2>" +
              "<p class='card-text'>" + value.dataContent + "</p>" +
              "<a href='./index.jsp?view=data&dataID="+value.dataID+"' class='btn btn-primary'>Read More &rarr;</a>" +
            "</div>" +
            "<div class='card-footer text-muted'>" +
              "Posted on " +value.dataCreateDate+" "
              "<a id='usernameId_"+value.dataAuthorID+"' href='#'>"+value.dataAuthorID+"</a>" +
            "</div>" +
          "</div>";
    	
    		$("#blogBody").append(blogPosts);
    		
    	});
	});
}


function listNavigations(){

	$.ajax({
		url: "../WekaInsightAPIs/rest/navigations/listvisible/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {

    }).done(function(response) {
    	
    	$.each(response, function(key, value) {
    		if(value.hasOwnProperty('attributes')){
    			
    			navigations = "<li class='nav-item dropdown'><a class='nav-link dropdown-toggle' href='"+value.navigationURL+"' role='button' data-toggle='dropdown'>"+value.navigationName+"</a>";
    			navigations += "<div class='dropdown-menu'>";
    			
    			$.each(value.attributes, function(k, v){
	    			navigations += "<a class='dropdown-item' href='index.jsp?view=datasbycat&attributeID="+v.attributeID+"'>"+v.attributeName+"</a>";
    			});
    	
    			navigations += "</div></li>";
    			
    		}else{

    			navigations = "<li class='nav-item'><a class='nav-link' href='"+value.navigationURL+"'>"+value.navigationName+"</a></li>";
    		}
    		$("#navigationUL").append(navigations);
    	});
	});
}



