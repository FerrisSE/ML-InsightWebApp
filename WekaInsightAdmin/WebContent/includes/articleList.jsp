  <h1 class="page-header">File Name</h1>
 
  <div class="form-group col-xs-12 col-md-6">
	 <label for="attribute1">attribute1</label>
	 <input type="text" class="form-control"  id="attribute1" autofocus required>
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="attribute2">attribute2</label>
	 <input type="text" class="form-control" id="attribute2" autofocus required>     
 </div>
 <div class="form-group col-xs-12 col-md-6">
	 <label for="attribute3">attribute3</label>
	 <input type="text" class="form-control" id="attribute3" autofocus required>     
</div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="attribute4">attribute4</label>
	 <input type="text" class="form-control" id="attribute4" autofocus required>     
</div>
<div class="form-group col-xs-12 col-md-6">
	 <label for="attribute5">attribute5</label>
	 <input type="text" class="form-control" id="attribute5" autofocus required>     
</div>
	
<div class="form-group">
	<span>
     	<button class="btn btn-primary"  type="submit" onclick="addArticle()" id="articleAdd" data-toggle="tooltip" title="Add Article">Add Article</button>
	</span>
	<span>
     	<button class="btn btn-primary"  type="button" onclick="listResult()" id="listResult" data-toggle="tooltip" title="List Result">List Result</button>
	</span>
 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.location.reload(true)" data-toggle="tooltip" title="Cancels adding the Article, and refreshes this webpage.">Cancel</button>
   	</span>
</div>   
 
<table class = "table table-hover">
    <thead id="postBody">
    <tr>
        <th></th>
        <th>attribute1</th>
        <th>attribute2</th>
        <th>attribute3</th>
        <th>attribute4</th>
        <th>attribute5</th>
    </tr>
    </thead>
</table>

<div id="deleteArticleModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Confirmation</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<p class="text-secondary">Are you sure you want to delete this Article?</p>
			<label>ID</label>
			<p id='attribute1' class="text-secondary"></p>
			<label>Name</label>
			<p id='attribute2' class="text-secondary"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="deleteArticle()">Delete</button>
			</div>
	</div>
</div>
</div>
    