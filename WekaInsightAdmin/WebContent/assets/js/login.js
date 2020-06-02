
function login(){
	var username =  $("#username").val();
	var password =  $("#password").val();

	if((username=="") || (password == "")){
		alert("Both account and password are requried");
		return;
	}
	
	var parms = { username:username, password:password}
	
	$.ajax({
		url: "./rest/authenticate/",
		type: 'POST',
		dataType : "json",
        contentType: "application/json",
        data: JSON.stringify(parms)
	}).fail(function(response) {
		console.log(JSON.stringify(response));

    }).done(function(response){

    	console.log(response);
    	
    	var result = response.message;
    	
    	$('#message').text(result);
    	
    	if(result =='success'){
    		
        	window.location="./index.jsp";
    	}
    	
	});
}	
