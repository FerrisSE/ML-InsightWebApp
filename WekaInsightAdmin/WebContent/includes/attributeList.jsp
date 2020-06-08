<h1 class="page-header">Attributes</h1>
 
  <div class="form-group col-xs-12 col-md-6">
	 <label for="attributeName">Attribute Name</label>
	 <input type="text" class="form-control" name="attributeName" id="attributeName" autofocus required>
 </div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="attributeVisible">Visible</label>
	 <select class="form-control" id="attributeVisible" name="attributeVisible">
	 	<option value= "1" selected >Yes</option>
	 	<option value= "0" >No</option>
	 </select>
</div>
<div class="form-group">
	<span>
     	<button class="btn btn-primary"  type="submit" onclick="addAttribute()" id="attributeAdd" data-toggle="tooltip" title="Add Attribute">Add Attribute</button>
	</span>

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.location.reload(true)" data-toggle="tooltip" title="Cancels adding the Attribute, and refreshes this webpage.">Cancel</button>
   	</span>
</div>   
 
<table class = "table table-hover">
    <thead id="attributeBody">
    <tr>
        <th></th>
        <th>Id</th>
        <th>Name</th>
        <th>Order</th>
        <th>Visible</th>
    </tr>
    </thead>
</table>

<div id="deleteAttributeModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Confirmation</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<p class="text-secondary">Are you sure you want to delete this Attribute?</p>
			<label>ID</label>
			<p id='attributeID' class="text-secondary"></p>
			<label>Name</label>
			<p id='attributeName' class="text-secondary"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="deleteAttribute()">Delete</button>
			</div>
	</div>
</div>
    