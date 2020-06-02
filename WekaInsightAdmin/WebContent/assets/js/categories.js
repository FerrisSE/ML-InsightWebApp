
function listCategories(){
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/categories/list/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));
    }).done(function(response){

    	$.each(response, function(key, value) {
    		if(value.categoryContent.length > 150){
    			value.categoryContent = value.categoryContent.substring(0,150)+"...";
    		}
    		
    		
    		var lstResults = "<tr><td><a href ='./index.jsp?view=catedit&edit="+value.categoryID+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a>"+
    		"<a href = '#' onclick=deleteCategoryModal('"+value.categoryID+"','"+encodeURIComponent(value.categoryName)+"') data-toggle='tooltip' title='Delete'><span class='fa fa-trash-alt' aria-hidden='true'></span><span class='sr-only'>Delete</span></a></td>" +
            "<td>"+value.categoryID+"</td><td>"+value.navigationID+"</td><td>"+value.categoryName+"</td><td>"+value.categoryImage+"</td><td>"+value.categoryContent+"</td>"+
    		"<td>"+value.categoryOrder+"</td><td>"+value.categoryVisible+"</td></tr>";
    		
    		
    		if($("#categoryBody").text()){
    		document.getElementById('categoryBody').innerHTML += lstResults;
    		}
    	});
	});
}

function addCategory(){

	var navigationID = $("#navigationID").val();
	var categoryName = $("#categoryName").val();
	var categoryImage = $("#categoryImage").val();
	var categoryContent = $("#categoryContent").val();
	var categoryOrder = $("#categoryOrder").val();
	var categoryVisible = $("#categoryVisible").val();
	var parms = {navigationID:navigationID, categoryName:categoryName, categoryImage:categoryImage, categoryContent:categoryContent, categoryOrder:categoryOrder, categoryVisible:categoryVisible}	
	$.ajax({
		url: "./rest/categories/add/",
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


function getCategory(categoryID){
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/categories/"+categoryID,
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    	
    	console.log(response);
    	
    	$("#navigationID").val(response.navigationID);
    	$("#categoryName").val(response.categoryName);
    	$("#categoryImage").val(response.categoryImage);
    	$("#categoryContent").val(response.categoryContent);
    	$("#categoryURL").val(response.categoryURL);
    	$("#categoryOrder").val(response.categoryOrder);
    	$("#categoryVisible").val(response.categoryVisible);

	});
}

function updateCategory(){
	var navigationID = $("#navigationID").val();
	var categoryName = $("#categoryName").val();
	var categoryImage = $("#categoryImage").val();
	var categoryContent = $("#categoryContent").val();
	var categoryOrder = $("#categoryOrder").val();
	var categoryVisible = $("#categoryVisible").val();
	
	var parms = {categoryID:categoryID, navigationID:navigationID, categoryName:categoryName, categoryImage:categoryImage, categoryContent:categoryContent, categoryOrder:categoryOrder, categoryVisible:categoryVisible}
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/categories/update/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	window.location = "./index.jsp?view=categorylist"
	});

}

	function deleteCategoryModal(categoryID,categoryName){
		
		console.log(categoryID);
		console.log(consoleName);
		$("#deleteCategoryModal").modal('show');
		
		$("#catID").text(categoryID);
		$("#catName").text(decodeURIComponent(categoryName));
		
	}

	
	function deleteCategory(){
		
		var categoryID = $('#catID').val();
		
		var parms = {categoryID:categoryID};
		
		$.ajax({
			url: "./rest/categories/delete/",
			type: 'POST',
			dataType : "json",
	        contentType: "application/json",
	        data: JSON.stringify(parms)
		}).fail(function(response) {
			console.log(JSON.stringify(response));
			console.log("Failed category delete");
	    }).done(function(response){
	    	console.log("Category tried to delete");
	    	window.location = "./index.jsp?view=categorylist"
		});
	}
	
	
