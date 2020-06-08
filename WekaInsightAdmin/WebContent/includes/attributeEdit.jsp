<h1 class="page-header">Attribute Edit</h1>
 
  <div class="form-group col-xs-12 col-md-6">
	 <label for="attributeName">Attribute Name</label>
	 <input type="text" class="form-control" name="attributeName" id="attributeName" autofocus required>
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="attributeURL">URL</label>
	 <input type="text" class="form-control" name="navURL" id="attributeURL" autofocus required>     
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="attributeOrder">Order</label>
	 <input type="text" class="form-control" name="attributeOrder" id="attributeOrder" autofocus required>     
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
     	<button class="btn btn-primary"  type="submit" onclick="updateAttribute()" id="attributeEdit" data-toggle="tooltip" title="Edit Attribute">Save Changes</button>
	</span>

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.history.back()" data-toggle="tooltip" title="Cancels editting the Attribute, and refreshes this webpage.">Cancel</button>
   	</span>
</div>   
 