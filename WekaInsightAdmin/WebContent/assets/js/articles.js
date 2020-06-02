$(document).ready(function(){
	//listArticles();
	var attribute;
});

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
    		
//    		var lstResults = "<td>"+value.attribute1+"</td><td>"+value.attribute2+"</td><td>"+value.attribute3+"</td><td>"+value.attribute4+"</td><td>"+value.attribute5+"</td></tr>";
//    		
//    		
    		
    		var lstResults = "<tr><td><a href ='./index.jsp?view=articleedit&edit="+value.attribute1+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a>"+
    		"<a href = '#' onclick=deleteCategoryModal('"+value.attribute1+"','"+encodeURIComponent(value.attribute1)+"') data-toggle='tooltip' title='Delete'><span class='fa fa-trash-alt' aria-hidden='true'></span><span class='sr-only'>Delete</span></a></td>" +
            "<td>"+value.attribute1+"</td><td>"+value.attribute2+"</td><td>"+value.attribute3+"</td><td>"+value.attribute4+"</td><td>"+value.attribute5+"</td></tr>";
    		

    		
    		if($("#postBody").text()){
    		document.getElementById('postBody').innerHTML += lstResults;
    		}
    	});
	});
}

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
    		var lstResults = "<a>test</a>"
    		
    		if($("#postBody").text()){
    		document.getElementById('postBody').innerHTML += lstResults;
    		}
	});
}


function getArticle(){
	
	$.ajax({
		url: "../WekaInsightAPIs/rest/articles/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    	
    	$("#attribute1").val(response.attribute1);
    	$("#attribute2").val(response.attribute2);
    	$("#attribute3").val(response.attribute3);
    	$("#attribute4").val(response.attribute4);
    	$("#attribute5").val(response.attribute5);

	});
}






function addArticle(){
	var attribute1 = $("#attribute1").val();
	var attribute2 = $("#attribute2").val();
	var attribute3 = $("#attribute3").val();
	var attribute4 = $("#attribute4").val();
	var attribute5 = $("#attribute5").val();
	
	var parms = { attribute1:attribute1, attribute2:attribute2, attribute3:attribute3, attribute4:attribute4, attribute5:attribute5}
	
	$.ajax({
		url: "./rest/articles/add/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	alert(response.message);
    	window.location = "./index.jsp?view=articlelist";

	});
}	

function updateArticle(){
	var attribute1 = $("#attribute1").val();
	var attribute2 = $("#attribute2").val();
	var attribute3 = $("#attribute3").val();
	var attribute4 = $("#attribute4").val();
	var attribute5 = $("#attribute5").val();
	
	var parms = { attribute1:attribute1, attribute2:attribute2, attribute3:attribute3, attribute4:attribute4, attribute5:attribute5}
	
	$.ajax({
		url: "./rest/articles/update/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	alert(response.message);
    	window.location = "./index.jsp?view=articlelist";
	});
}

function deleteArticleModal(attribute){
		
		console.log(attribute);
		$("#deleteArticleModal").modal('show');
		
		$("#attNum").text(decodeURIComponent(attribute));
		
	}

	
	function deleteArticle(){
		
		var attribute = $('#attNum').val();
		
		var parms = {attribute:attribute};
		
		$.ajax({
			url: "./rest/articles/delete/",
			type: 'POST',
			dataType : "json",
	        contentType: "application/json",
	        data: JSON.stringify(parms)
		}).fail(function(response) {
			console.log(JSON.stringify(response));
			console.log("Failed Attribute delete");
	    }).done(function(response){
	    	console.log("Attribute tried to delete");
	    	window.location = "./index.jsp?view=articlelist"
		});
	}
	