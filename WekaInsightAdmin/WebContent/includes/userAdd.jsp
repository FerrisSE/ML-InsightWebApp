<h1 class="page-header">Add Users</h1>
 
  <div class="form-group col-xs-12 col-md-6">
	 <label for="firstName">First Name</label>
	 <input type="text" class="form-control" id="firstName" autofocus required>
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="lastName">Last Name</label>
	 <input type="text" class="form-control" id="lastName" autofocus required>     
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="email">Email</label>
	 <input type="text" class="form-control" id="email" autofocus required>     
</div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="username">Username</label>
	 <input type="text" class="form-control" id="username" autofocus required>     
</div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="password">password</label>
	 <input type="text" class="form-control" id="password" autofocus required>     
</div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="active">active</label>
	 <select class="form-control" id="active" >
	 	<option value= "1" selected >Yes</option>
	 	<option value= "0" >No</option>
	 </select>
</div>

<div class="form-group">
	<span>
     	<button class="btn btn-primary"  type="submit" onclick="addUser()" id="userAdd" data-toggle="tooltip" title="Add User">Add User</button>
	</span>

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.history.back()" data-toggle="tooltip" title="Cancels adding the User and refreshes this webpage.">Cancel</button>
   	</span>
</div>   
 