
function listUsers(){
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/users/list/",
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));
    }).done(function(response){

    	$.each(response, function(key, value) {
    		var lstResults = "<tr><td><a href ='./index.jsp?view=useredit&edit="+value.userID+"' data-toggle='tooltip' title='View & Edit'><span class='fa fa-pencil-alt fa-fw' aria-hidden='true'></span><span class='sr-only'>View and Edit</span></a></td>" +
            "<td>"+value.userID+"</td><td>"+value.firstName+"</td><td>"+value.lastName+"</td><td>"+value.email+"</td><td>"+value.username+"</td><td>"+value.password+"</td>"+
    		"<td>"+value.active+"</td><td>"+value.userCreateDate+"</td></tr>";
    		
    		
    		if($("#userBody").text()){
    		document.getElementById('userBody').innerHTML += lstResults;
    		}
    	});
	});
}

function addUser(){

//	var userID = $("#userID").val();
	var firstName =  $("#firstName").val();
	var lastName =  $("#lastName").val();
	var email =  $("#email").val();
	var username =  $("#username").val();
	var password =  $("#password").val();
	var active =  $("#active").val();
//	var userCreateDate = $("#userCreateDate").val(response.userCreateDate);
	
	var parms = {firstName:firstName, lastName:lastName, email:email, username:username, password:password, active:active}
	
	$.ajax({
		url: "./rest/users/add/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));
		console.log("addUser Failed");

    }).done(function(response){
    	console.log("addUser Success");
    	window.location="./index.jsp?view=userlist";
	});
}	


function getUser(userID){
	
	$.ajax({
		url: "../SENG315FinalProjectAPIs/rest/users/"+userID,
		type: 'GET',
		dataType : "json",
        contentType: "application/json",
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    	$("#userID").val(response.userID);
    	 $("#firstName").val(response.firstName);
    	 $("#lastName").val(response.lastName);
    	 $("#email").val(response.email);
    	 $("#username").val(response.username);
    	 $("#password").val(response.password);
    	 $("#active").val(response.active);
    	 $("#userCreateDate").val(response.userCreateDate);

	});
}

function updateUser(){
	var firstName = $("#firstName").val();
	var lastName = $("#lastName").val();
	var email = $("#email").val();
	var username = $("#username").val();
	var password = $("#password").val();
	var active = $("#active").val();
	//var userCreateDate = $("#userCreateDate").val();

	
	var parms = {userID:userID, firstName:firstName, lastName:lastName, email:email, username:username, password:password, active:active}
	
	$.ajax({
		url: "./rest/users/update/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){
    	console.log(response);
    	window.location = "./index.jsp?view=userlist"
	});
}