
function listAttributes(){
	
	$.ajax({
		url: "../WekaInsightAPIs/rest/attributes/list/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));
    }).done(function(response){

    	$.each(response, function(key, value) {
    		var lstResults = "<tr><td><a href ='./index.jsp?view=attedit&edit="+value.attributeID+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a>" +
    		"<a href = '#' onclick=deleteAttributeModal('"+value.attributeID+"','"+encodeURIComponent(value.attributeName)+"') data-toggle='tooltip' title='Delete'><span class='fa fa-trash-alt' aria-hidden='true'></span><span class='sr-only'>Delete</span></a></td>" +
    		"<td>"+value.attributeID+"</td><td>"+value.attributeName+"</td><td>"+value.attributeURL+"</td><td>"+value.attributeOrder+"</td>"+
    		"<td>"+value.attributeVisible+"</td></tr>";
    		
    		
    		if($("#attributeBody").text()){
    		document.getElementById('attributeBody').innerHTML += lstResults;
    		}
    	});
	});
}

function addAttribute(){
	var attributeName = $("#attributeName").val();
	var attributeURL = $("#attributeURL").val();
	var attributeOrder = $("#attributeOrder").val();
	var attributeVisible = $("#attributeVisible").val();
	var parms = {attributeName:attributeName, attributeURL:attributeURL, attributeOrder:attributeOrder, attributeVisible:attributeVisible}
	
	$.ajax({
		url: "./rest/attributes/add/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	window.location.reload(true);
	});
}	


function getAttribute(attributeID){
	
	$.ajax({
		url: "../WekaInsightAdmin/rest/attributes/"+attributeID,
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    	
    	$("#attributeName").val(response.attributeName);
    	$("#attributeURL").val(response.attributeURL);
    	$("#attributeOrder").val(response.attributeOrder);
    	$("#attributeVisible").val(response.attributeVisible);

	});
}

function updateAttribute(){
	var attributeName = $("#attributeName").val();
	var attributeURL = $("#attributeURL").val();
	var attributeOrder = $("#attributeOrder").val();
	var attributeVisible = $("#attributeVisible").val();
	
	var parms = {attributeID:attributeID, attributeName:attributeName, attributeURL:attributeURL, attributeOrder:attributeOrder, attributeVisible:attributeVisible}
	
	$.ajax({
		url: "./rest/attributes/update/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	window.location = "./index.jsp?view=attributelist"
	});
	
}

function deleteAttributeModel(attributeID,attributeName){
		$("#deleteAttributeModel").modal('show');
		
		$("#attributeID").text(attributeID);
		$("#attributeName").text(decodeURIComponent(attributeName));
		
	}
	
	function deleteAttribute(){
		
		var attributeID = $('#attributeID').text();
		
		var parms = {attributeID:attributeID};
		
		$.ajax({
			url: "./rest/attributes/delete/",
			type: 'POST',
			dataType : "json",
	        contentType: "application/json",
	        data: JSON.stringify(parms)
		}).fail(function(response) {
			console.log(JSON.stringify(response));

	    }).done(function(response){

	    	window.location = "./index.jsp?view=attributelist"
		});
	}