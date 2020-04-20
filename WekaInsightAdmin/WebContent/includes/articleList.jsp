<h1 class="page-header">Classifier</h1>
    <table>
    	<tbody id="postBody">
    	<h2 id = testTitle>Title</h2>
    	  
    		<tr>
    			<th >Body</th>
    			<p id="results">Test Results go here</p>
    			<p id='testResult' class="text-secondary"></p>
    		</tr>
    		<tr>
        <td>Select a File to Load:</td>
        <td><input type="file" id="fileToLoad"></td>
        <td><button onclick="postFile()">Load Selected File</button><td>
    </tr>
    		 <div class="form-group">
 <span>
     <button class="btn btn-primary"  type="submit" onclick="getResult()" id="results" data-toggle="tooltip" title="Get Result">Select File</button>
 </span>

<button type="button" onclick="clickHandler()">Click Me!</button>

<script>
    function clickHandler() {
      alert("something");
       try{
      getResult();
      alert("Something Was Called")
       }catch(Exception ){
    	   alert("get result failed")
       }
      
    }
</script>

 <span>
     <input class = "btn btn-link" type="button" onclick="window.history.back()" value="Cancel" data-toggle="tooltip" title="Cancel">
   </span>
</div>
    	</tbody>
    </table>
