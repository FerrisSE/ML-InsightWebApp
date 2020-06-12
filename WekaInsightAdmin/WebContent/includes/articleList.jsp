  <h1 class="page-header">File Name</h1>
	 <input type="file" id="fileUpload" />
<input type="button" id="upload" value="Upload" onclick="Upload()" />
	<input type="button" id="edit" value="Edit File" onclick="GetTable()" />
<div class="form-group">

<div class="dropdown">
  <button onclick="build_function()" class="dropbtn">Build Prediction Model</button>
  <div id="buildDropdown" class="dropdown-content">
    <input type="text" id="buildInput" onkeyup="filterFunction()">
    <a href="#wekaAPI">wekaAPI</a>
    <a href="#TensorFlow">TensorFlow</a>
    <a href="#Sci-kitLearn">Sci-kit Learn</a>

  </div>
</div>
<!-- 	<span> -->
<!--      	<button class="btn btn-primary"  type="button" onclick="listResult()" id="listResult" data-toggle="tooltip" title="List Result">Build Prediction Model</button> -->
<!-- 	</span> -->

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.location.reload(true)" data-toggle="tooltip" title="Cancels adding the Article, and refreshes this webpage.">Cancel</button>
   	</span>

</div>   





<style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
</style>
</head>
<body>



<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function build_function() {
  document.getElementById("buildDropdown").classList.toggle("show");
}
function attribute_selection() {
	  document.getElementById("attributeDropdown").classList.toggle("show");
	}
function Statistic_tools() {
	  document.getElementById("statDropdown").classList.toggle("show");
	}

function filter_Function_Build() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("buildInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("buildDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
function filter_Function_Attribute() {
	  var input, filter, ul, li, a, i;
	  input = document.getElementById("attributeInput");
	  filter = input.value.toUpperCase();
	  div = document.getElementById("attributeDropdown");
	  a = div.getElementsByTagName("a");
	  for (i = 0; i < a.length; i++) {
	    txtValue = a[i].textContent || a[i].innerText;
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	      a[i].style.display = "";
	    } else {
	      a[i].style.display = "none";
	    }
	  }
	}
</script>


<script type="text/javascript">
function setValue(){
document.getElementById("attribute_select").value=document.getElementById("colour").value;
document.productForm.submit();
return true;
}
</script>
<div>
<form method="post"  name="productForm">
    <select id="colour" name="colour" onchange="return setValue();">
        <option value="dropdown">Select an Attribute</option>
        <option value="outlook">outlook
        <option value="temperature">temperature
        <option value="humidity">humidity
        <option value="windy">windy
        <option value="play">play        
    </select>
    <input type="hidden" name="dropdown" id="dropdown">
    <input type="submit" value="click" name="btn_dropdown">


  <%
        String colour = request.getParameter("colour").toString();
        out.println("Attribute Selected: "+colour);
   %>
</form>
</div>


<div class="navbar">
  <div class="dropdown">
  <button class="dropbtn" onclick="Statistic_tools()">Statistics
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-content" id="statDropdown">
    <a href="#sortByMin">Min Sort</a>
    <a href="#sortByMax">Max Sort</a>
    <a href="#getAverage" onclick="getAverage()">Average</a>
  </div>
  </div> 
</div>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function wekatools() {
  document.getElementById("ropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}
</script>


	<!--    	<span> -->
	<!--    	<button onclick="exportTableToCSV('testingSave.csv')">Export HTML Table To CSV File</button> -->
	<!--    	</span> -->

<hr />
<div id="dvCSV">
</div>

<p id=result></p>
 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<!-- <script type = "text/javascript"> -->

<!--  function download_csv(csv, filename) { -->
<!--      var csvFile; -->
<!--      var downloadLink; -->

<!--      // CSV FILE -->
<!--      csvFile = new Blob([csv], {type: "text/csv"}); -->

<!--      // Download link -->
<!--      downloadLink = document.createElement("a"); -->

<!--      // File name -->
<!--      downloadLink.download = filename; -->

<!--      // We have to create a link to the file -->
<!--      downloadLink.href = window.URL.createObjectURL(csvFile); -->

<!--      // Make sure that the link is not displayed -->
<!--      downloadLink.style.display = "none"; -->

<!--      // Add the link to your DOM -->
<!--      document.body.appendChild(downloadLink); -->

<!--      // Lanzamos -->
<!--      downloadLink.click(); -->
<!--  } -->

<!--  function export_table_to_csv(filename) { -->
<!--  	var csv = []; -->
<!--  	var rows = document.querySelectorAll("table"); -->
	
<!--      for (var i = 0; i < rows.length; i++) { -->
<!--  		var row = [], cols = rows[i].querySelectorAll("td, th"); -->
	
<!--          for (var j = 0; j < cols.length; j++)  -->
<!--              row.push(cols[j].innerText); -->
        
<!--  		csv.push(row.join(","));		 -->
<!--  	} -->
<!--      // Download CSV -->
<!--      download_csv(csv.join("\n"), filename); -->
<!--  } -->

<!--  document.querySelector("button").addEventListener("click", function () { -->
<!--      var html = document.querySelector("table").outerHTML; -->
<!--  	export_table_to_csv(filename+".csv"); -->
<!--  }); -->

<!-- </script> -->







<script type="text/javascript">
    function Upload() {
        var fileUpload = document.getElementById("fileUpload");
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
        
        var text_current='';
        var attribute_data=[0,""];     
        var attribute_rows=[];
        var i;
        
    	var random_id = function  () 
    	{
    		var id_num = Math.random().toString(9).substr(2,3);
    		var id_str = Math.random().toString(36).substr(2);
    		
    		return id_num + id_str;
    	}
 

        
        if (regex.test(fileUpload.value.toLowerCase())) {
            if (typeof (FileReader) != "undefined") {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var table = document.createElement("table");
                    table.setAttribute('class','table table-hover')
                    var rows = e.target.result.split("\n");
					var drop_current = '';
                    for (i = 0; i < rows.length; i++) {
                        var cells = rows[i].split(",");
                        attribute_current=rows[i].split(",");
                        if (cells.length > 1) {
                            var row = table.insertRow(-1);
							
                         //   attribute_data=[];
                            for (var j = 0; j < cells.length; j++) {
                                var cell = row.insertCell(-1);
									if(i==0){
										if(j==0)text_current ='<thead><tr>';
	                                    text_current = text_current+('<th>'+cells[j]+'</th>');
	        
// 	                                    var attribute_Dropdown = document.getElementById("attribute_Dropdown");
// 	                                    attribute_Dropdown.innerHTML = drop_current;
	                                    document.getElementById("attributeInput").innerHTML = '<a>'+cells[j]+'</a>';
	                                    table.innerHTML =text_current;
	                                    
	                                    table.innerHTML =text_current;
										if(j==cells.length-1)text_current ='</thead></tr></tbody>';
									}else{
										text_current="";
	                                    cell.innerHTML = '<td ><div class="row_data" edit_type="click" col_name="'+j+'">'+cells[j]+'</div></td>';
										if(i==cells.length-1){
											text_current='<td>'+								 
																'<span class="btn_edit" > <a href="#" class="btn btn-link " row_id="'+i+'" > Edit</a> </span>'+
																'<span class="btn_save"> <a href="#" class="btn btn-link"  row_id="'+i+'"> Save</a> | </span>'+
																'<span class="btn_cancel"> <a href="#" class="btn btn-link" row_id="'+i+'"> Cancel</a> | </span>'+
														'</td>'+						
												'</tr>';
											
										}
									}
                                    attribute_data.push([i,cells[j]]);
									console.log(attribute_data);
                                    //attribute_data.push(new String(cells[j]));
   	                         

   						    }
                        }
                    }
                                	              
                    var dvCSV = document.getElementById("table_attributes");
                    dvCSV.innerHTML = "";
                    dvCSV.appendChild(table);
                    var table_attributes = document.getElementById("table");
                    table_attributes.innerHTML = "";
                    table_attributes.appendChild(table);
                }
                reader.readAsText(fileUpload.files[0]);
     //           getTable();
				$(document).find('.tbl_data').html(table);
				//$(document).find('.tbl_data').html(table);
               // TableEdit(attribute_row1,attribute_row2,attribute_row3,attribute_row4,attribute_row5,attribute_row6,attribute_row7,attribute_row8,attribute_row9,attribute_row10,attribute_row11,attribute_row12,attribute_row13,attribute_row14,attribute_row15);
  	
            } else {
                alert("This browser does not support HTML5.");
            }
        } else {
            alert("Please upload a valid CSV file.");
        }
    }
</script>

        <span id="val"></span>


<br>

  <!-- Editable table -->
<div class="card">
  <div class="card-body">
    <div id="table_attributes" class="table-editable">
      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
            class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
      <table class="table table-bordered table-responsive-md table-striped text-center">
        <thead>
          <tr>
            <th class="text-center">Attributes</th>
            <th class="text-center">Will</th>
            <th class="text-center">Appear</th>
            <th class="text-center">Here</th>
            <th class="text-center">After</th>
            <th class="text-center">Uploading</th>
            <th class="text-center">File</th>
          </tr>
        </thead>
        <tbody>
	
          </tbody>
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
</div>
    <br>


    