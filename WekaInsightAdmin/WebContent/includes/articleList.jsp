  <h1 class="page-header">File Name</h1>
  
		<input type="file" name="filename" id="filename">
<!-- 		<button id="upload_data" value="Upload">upload</button> -->
		<div class="csv"></div>

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
	  document.getElementById("colours").classList.toggle("show");
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
<script>
   function selection(){
	   var e = document.getElementById("ddl");
	   var attribute_sel = e.options[e.selectedIndex].text;
	   if(attribute_sel !=""){
	   if(e.classList!=("visible")){
	   document.getElementById("stats_block").classList=("visible");
	   }
	   }
	   }
   
</script>

<div >
<select style="width:170px" id="ddl">
<option></option>
</select>
<input type="button" value="Confirm Selection" onclick="selection()">
</div>


<!-- <input type="button" value="getvalue" onclick="abc()" /> -->



<div class="navbar">
  <div class="dropdown" id="stats_block" style="visibility:hidden">
  <button class="dropbtn" onclick="Statistic_tools()">Statistics
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-content"  id="statDropdown" ">
    <a href="#getMin"  onclick="getMin()">Min</a>
    <a href="#getMax"  onclick="getMax()">Max</a>
    <a href="#getAverage" onclick="getAverage()">Mean</a>
    <a href="#getMode" onclick="getMode()">Mode</a>
    
  </div>
  </div> 
</div>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function wekatools() {
  document.getElementById("dropdown").classList.toggle("show");
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


   	<span>
   	<button onclick="exportTableToCSV('testingSave.csv')">Export HTML Table To CSV File</button>
   	</span>

<hr />
<div id="dvCSV">
</div>

<p id=result></p>
 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- <button type="button" onclick="clickHandler()">Click Me!</button> -->




<script type = "text/javascript">

function download_csv(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV FILE
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // We have to create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Make sure that the link is not displayed
    downloadLink.style.display = "none";

    // Add the link to your DOM
    document.body.appendChild(downloadLink);

    // Lanzamos
    downloadLink.click();
}

function export_table_to_csv(filename) {
	var csv = [];
	var rows = document.querySelectorAll("table");
	
    for (var i = 0; i < rows.length; i++) {
		var row = [], cols = rows[i].querySelectorAll("td, th");
		
        for (var j = 0; j < cols.length; j++) 
            row.push(cols[j].innerText);
        
		csv.push(row.join(","));		
	}

    // Download CSV
    download_csv(csv.join("\n"), filename);
}

document.querySelector("button").addEventListener("click", function () {
    var html = document.querySelector("table").outerHTML;
	export_table_to_csv(filename+".csv");
});

</script>





  
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha256-/SIrNqv8h6QGKDuNoLGA4iret+kyesCkHGzVUUV0shc=" crossorigin="anonymous"></script>
<!--   	<script src='app1.js'></script> -->
  	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-csv/0.71/jquery.csv-0.71.min.js"></script>



<script type="text/javascript">

$(document).ready(function(){
	var data;
	
	$("#filename").change(function(e){
		var ext = $("#filename").val().split(".").pop().toLowerCase();

		if($.inArray(ext, ["csv"]) == -1) {
			alert('Upload CSV');
			return false;
		}

		if(e.target.files != undefined){
			var reader = new FileReader();
			reader.onload = function(e){
				
				  var optionList = [];
				
				csvResult = e.target.result.split(/\r|\n|\r\n/);
			    var employee_data = e.target.result.split(/\r|\n|\r\n/);
			    var table_data = '<table class="table table-bordered table-striped">';
			    for(var count = 0; count<employee_data.length; count++)
			    {
			     var cell_data = employee_data[count].split(",");
			     table_data += '<tr>';
			     for(var cell_count=0; cell_count<cell_data.length; cell_count++)
			     {
			      if(count === 0)
			      {
			       table_data += '<th>'+cell_data[cell_count]+'</th>';
					  optionList[cell_count] = document.createElement("option");
					  optionList[cell_count].setAttribute("id", "ddl");	
					  optionList[cell_count].text = cell_data[cell_count];
					  optionList[cell_count].value = cell_count;
					  document.getElementById("ddl").appendChild(optionList[cell_count]);
			      }
			      else
			      {
			       table_data += '<td>'+cell_data[cell_count]+'</td>';
			      }
			     }
			     table_data += '</tr>';
			    }
			    table_data += '</table>';
			    $('#table_attributes').html(table_data);
	
				$('.csv').append(csvResult);
			}
			reader.readAsText(e.target.files.item(0));
		}
	});
	
	
	$.ajax({
	  type: "GET",  
	  url: "http://localhost:8082/WekaInsightAPIs/CSVsamples/weather.numeric.csv",
	  dataType: "text",       
	  success: function(response)  
	  {
		data = $.csv.toArrays(response);
		generateHtmlTable(data);
	  }   
	});
	
	function generateHtmlTable(data) {
		var html = '<table  class="table table-condensed table-hover table-striped">';

    if(typeof(data[0]) === 'undefined') {
      return null;
    } else {
		$.each(data, function( index, row ) {
		  //bind header
		  if(index == 0) {
			html += '<thead>';
			html += '<tr>';
			$.each(row, function( index, colData ) {
				html += '<th>';
				html += colData;
				html += '</th>';
			});
			html += '</tr>';
			html += '</thead>';
			html += '<tbody>';
		  } else {
			html += '<tr>';
			$.each(row, function( index, colData ) {
				html += '<td>';
				html += colData;
				html += '</td>';
			});
			html += '</tr>';
		  }
		});
		html += '</tbody>';
		html += '</table>';
		
		$('#csv-display').append(html);
	  }
	}
});

</script >

    <h3 id="val"></h3>
<script type="text/javascript">
 function getAverage(){ 
	 
  var table = document.getElementById("table_attributes");
 var avgVal=0;
 var sumVal = 0;
 var rowCount = $('#myTable tr').length;
 var count=0;
 var e = document.getElementById("ddl");
 var attribute_sel = e.selectedIndex;
 var tester;
//  console.log(attribute_sel);

	 $('#table_attributes tbody tr td:nth-child('+attribute_sel+')').each( function(){
		 tester=$(this).text();
		 //console.log(tester);
 
// 		 console.log($(this).text());
		   //add item to array
		   sumVal = sumVal + parseInt($(this).text());
// 		   console.log(sumVal);
		   count++;
		 });
	 
	 var re = new RegExp("^([0-9])$");
	 if (re.test(tester)) {
	     console.log("Valid");
	 } else {
	     console.log("Invalid");
	     getMode();
	 }
	 	avgVal=Math.round(sumVal/count);
	 	console.log("avgVal= "+avgVal);


document.getElementById("val").innerHTML = "Average Value = " +avgVal;

 }
 
 function getMode(){
	 
	  var table = document.getElementById("table_attributes");
	  var mode="";
	  var sumVal = 0;
	  var rowCount = $('#myTable tr').length;
	  var count=0;
	  var e = document.getElementById("ddl");
	  var attribute_sel = e.selectedIndex;
	  var cell_array=[];
	  
	 	 $('#table_attributes tbody tr td:nth-child('+attribute_sel+')').each( function(){
	 		  cell_array.push( $(this).text() );  

	 	});


	     var modeMap = {};
	     var maxEl = cell_array[0], maxCount = 1;
	     for(var i = 0; i < cell_array.length; i++)
	     {
	         var el = cell_array[i];
	         if(modeMap[el] == null)
	             modeMap[el] = 1;
	         else
	             modeMap[el]++;  
	         if(modeMap[el] > maxCount)
	         {
	             maxEl = el;
	             maxCount = modeMap[el];
	         }
	     }
		 document.getElementById("val").innerHTML = "Mode Value = " +maxEl;

 }
	 
 function getMin(){ 
	 
	  var table = document.getElementById("table_attributes");
	 var min_val=1000000000000000000000000000;
	 var current_val = 0;
	 var e = document.getElementById("ddl");
	 var attribute_sel = e.selectedIndex;
	 
	 $('#table_attributes tbody tr td:nth-child('+attribute_sel+')').each( function(){
			// console.log($(this).text());
			   //add item to array
			   			   current_val=($(this).text());
			   if(current_val<min_val)min_val=current_val;
			   console.log(min_val);

			});


	document.getElementById("val").innerHTML = "Current Minimum Value = " +min_val;

	} 

 function getMax(){ 
	 
	  var table = document.getElementById("table_attributes");
	 var max_val=0;
	 var current_val = 0;
	 var e = document.getElementById("ddl");
	 var attribute_sel = e.selectedIndex;
	 
	 $('#table_attributes tbody tr td:nth-child('+attribute_sel+')').each( function(){
			// console.log($(this).text());
			   //add item to array
			   current_val=($(this).text());
			   if(current_val>max_val)max_val=current_val;
			   console.log(max_val);

			});


	document.getElementById("val").innerHTML = "Current Maximum Value = " +max_val;

	} 
 </script> 
<br>


  <!-- Editable table -->
<div class="card">
  <div class="card-body">
  <div class="well">
    <div id="table_attributes" class="table-editable" style="height:500px;width:1600px;overflow: scroll;">
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
	</div>
	</div>
	</div>
	</div>
	
    <br>