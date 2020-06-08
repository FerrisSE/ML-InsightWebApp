  <h1 class="page-header">File Name</h1>
	 <input type="file" id="fileUpload" />
<input type="button" id="upload" value="Upload" onclick="Upload()" />
	<input type="button" id="edit" value="Edit File" onclick="GetTable()" />
<div class="form-group">

	<span>
     	<button class="btn btn-primary"  type="button" onclick="listResult()" id="listResult" data-toggle="tooltip" title="List Result">classify</button>
	</span>

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.location.reload(true)" data-toggle="tooltip" title="Cancels adding the Article, and refreshes this webpage.">Cancel</button>
   	</span>
</div>   


<hr />
<div id="dvCSV">
</div>

<p id=result></p>
 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<button onclick="exportTableToCSV('members.csv')">Export HTML Table To CSV File</button>
<button type="button" onclick="clickHandler()">Click Me!</button>
  <!-- Navigation -->
  <nav>
    <div class="container">
      <a class="navbar-brand" href="./index.jsp">eSports Central</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul id="navigationUL" class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="./index.jsp">Home</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


<script type = "text/javascript">
    function clickHandler() {
       	
       try{

      //getResult();
      alert("Something Was Called");
       }catch(Exception ){
    	   alert("get result failed");	
       }
      
    }
</script>


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
	var rows = document.querySelectorAll("table tr");
	
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


<script type="text/javascript">
    function Upload() {
        var fileUpload = document.getElementById("fileUpload");
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
        
        var attribute_data=[];     
      
        var attribute_rows=[];
        var attribute_row1=[];
        var attribute_row2=[];
        var attribute_row3=[];
        var attribute_row4=[];
        var attribute_row5=[];
        var attribute_row6=[];
        var attribute_row7=[];
        var attribute_row8=[];
        var attribute_row9=[];
        var attribute_row10=[];
        var attribute_row11=[];
        var attribute_row12=[];
        var attribute_row13=[];
        var attribute_row14=[];
        var attribute_row15=[];
        var i;
        
        if (regex.test(fileUpload.value.toLowerCase())) {
            if (typeof (FileReader) != "undefined") {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var table = document.createElement("table");
                    var rows = e.target.result.split("\n");
                    for (i = 0; i < rows.length; i++) {
                        var cells = rows[i].split(",");
                        if (cells.length > 1) {
                            var row = table.insertRow(-1);

                         //   attribute_data=[];
                            for (var j = 0; j < cells.length; j++) {
                                var cell = row.insertCell(-1);

                                    cell.innerHTML = cells[j]+" | ";
   								//attribute_data.push(new String(cells[j]));
   	                            switch(i){
   	                            case 0:
   	                                attribute_row1.push(String(cells[j]));
   	                            	console.log(attribute_row1);
   	                            	if(attribute_row1.length==cells.length){
   	                            		attribute_rows.push(attribute_row1);
   	                            	}
   	                                break;
   	                            case 1:
   	                                attribute_row2.push(String(cells[j]));
   	                                console.log(attribute_row2);
   	                            	if(attribute_row2.length==cells.length){
   	                            		attribute_rows.push(attribute_row2);
   	                            	}
   	                                break;
   	                            case 2:
   	                                attribute_row3.push(String(cells[j]));
   	                                console.log(attribute_row3);
   	                            	if(attribute_row3.length==cells.length){
   	                            		attribute_rows.push(attribute_row3);
   	                            	}
   	                                break;
   	                            case 3:
   	                                attribute_row4.push(String(cells[j]));
   	                                console.log(attribute_row4);
   	                            	if(attribute_row4.length==cells.length){
   	                            		attribute_rows.push(attribute_row4);
   	                            	}
   	                                break;
   	                            case 4:
   	                                attribute_row5.push(String(cells[j]));
   	                                console.log(attribute_row5);
   	                            	if(attribute_row5.length==cells.length){
   	                            		attribute_rows.push(attribute_row5);
   	                            	}
   	                                break;
   	                            case 5:
   	                                attribute_row6.push(String(cells[j]));
   	                                console.log(attribute_row6);
   	                            	if(attribute_row6.length==cells.length){
   	                            		attribute_rows.push(attribute_row6);
   	                            	}
   	                                break;
   	                            case 6:
   	                                attribute_row7.push(String(cells[j]));
   	                                console.log(attribute_row7);
   	                            	if(attribute_row7.length==cells.length){
   	                            		attribute_rows.push(attribute_row7);
   	                            	}
   	                                break;
   	                            case 7:
   	                                attribute_row8.push(String(cells[j]));
   	                                console.log(attribute_row8);
   	                            	if(attribute_row8.length==cells.length){
   	                            		attribute_rows.push(attribute_row8);
   	                            	}
   	                                break;
   	                            case 8:
   	                                attribute_row9.push(String(cells[j]));
   	                                console.log(attribute_row9);
   	                            	if(attribute_row9.length==cells.length){
   	                            		attribute_rows.push(attribute_row9);
   	                            	}
   	                                break;
   	                            case 9:
   	                                attribute_row10.push(String(cells[j]));
   	                                console.log(attribute_row10);
   	                            	if(attribute_row10.length==cells.length){
   	                            		attribute_rows.push(attribute_row10);
   	                            	}
   	                                break;
   	                            case 10:
   	                                attribute_row11.push(String(cells[j]));
   	                                console.log(attribute_row11);
   	                            	if(attribute_row11.length==cells.length){
   	                            		attribute_rows.push(attribute_row11);
   	                            	}
   	                                break;
   	                            case 11:
   	                                attribute_row12.push(String(cells[j]));
   	                                console.log(attribute_row12);
   	                            	if(attribute_row12.length==cells.length){
   	                            		attribute_rows.push(attribute_row12);
   	                            	}
   	                                break;
   	                            case 12:
   	                                attribute_row13.push(String(cells[j]));
   	                                console.log(attribute_row13);
   	                            	if(attribute_row14.length==cells.length){
   	                            		attribute_rows.push(attribute_row13);
   	                            	}
   	                                break;
   	                            case 13:
   	                                attribute_row14.push(String(cells[j]));
   	                                console.log(attribute_row14);
   	                            	if(attribute_row14.length==cells.length){
   	                            		attribute_rows.push(attribute_row14);
   	                            	}
   	                                break;
   	                            case 14:
   	                                attribute_row15.push(String(cells[j]));
   	                                console.log(attribute_row15);
   	                            	if(attribute_row15.length==cells.length){
   	                            		attribute_rows.push(attribute_row15);
   	                            	}
   	                                break;
   	                           	default:
   	                           		break;
   	                            }

   						    }
                        }
                    }
                                	              
                    var dvCSV = document.getElementById("dvCSV");
                    dvCSV.innerHTML = "";
                    dvCSV.appendChild(table);
                }
                reader.readAsText(fileUpload.files[0]);
     //           getTable();
				console.log(attribute_row1[0]);
               // TableEdit(attribute_row1,attribute_row2,attribute_row3,attribute_row4,attribute_row5,attribute_row6,attribute_row7,attribute_row8,attribute_row9,attribute_row10,attribute_row11,attribute_row12,attribute_row13,attribute_row14,attribute_row15);
  	
            } else {
                alert("This browser does not support HTML5.");
            }
        } else {
            alert("Please upload a valid CSV file.");
        }
    }
    </script>
<script type="text/javascript">

	function TableEdit(attribute_row1,attribute_row2,attribute_row3,attribute_row4,attribute_row5,attribute_row6,attribute_row7,attribute_row8,attribute_row9,attribute_row10,attribute_row11,attribute_row12,attribute_row13,attribute_row14,attribute_row15){
$(document).ready(function(){
//function GetTable(){
	
	    attr1={att1:attribute_row1[0], att2:attribute_row1[1], att3:attribute_row1[2], att4:attribute_row1[3], att5:attribute_row1[4]};
        attr2={att1:attribute_row2[0], att2:attribute_row2[1], att3:attribute_row2[2], att4:attribute_row2[3], att5:attribute_row2[4]};
        attr3={att1:attribute_row3[0], att2:attribute_row3[1], att3:attribute_row3[2], att4:attribute_row3[3], att5:attribute_row3[4]};
        attr4={att1:attribute_row4[0], att2:attribute_row4[1], att3:attribute_row4[2], att4:attribute_row4[3], att5:attribute_row4[4]};
        attr5={att1:attribute_row5[0], att2:attribute_row5[1], att3:attribute_row5[2], att4:attribute_row5[3], att5:attribute_row5[4]};
	    attr6={att1:attribute_row6[0], att2:attribute_row6[1], att3:attribute_row6[2], att4:attribute_row6[3], att5:attribute_row6[4]};
        attr7={att1:attribute_row7[0], att2:attribute_row7[1], att3:attribute_row7[2], att4:attribute_row7[3], att5:attribute_row7[4]};
        attr8={att1:attribute_row8[0], att2:attribute_row8[1], att3:attribute_row8[2], att4:attribute_row8[3], att5:attribute_row8[4]};
        attr9={att1:attribute_row9[0], att2:attribute_row9[1], att3:attribute_row9[2], att4:attribute_row9[3], att5:attribute_row9[4]};
        attr10={att1:attribute_row10[0], att2:attribute_row10[1], att3:attribute_row10[2], att4:attribute_row10[3], att5:attribute_row10[4]};
	    attr11={att1:attribute_row11[0], att2:attribute_row11[1], att3:attribute_row11[2], att4:attribute_row11[3], att5:attribute_row11[4]};
        attr12={att1:attribute_row12[0], att2:attribute_row12[1], att3:attribute_row12[2], att4:attribute_row12[3], att5:attribute_row12[4]};
        attr13={att1:attribute_row13[0], att2:attribute_row13[1], att3:attribute_row13[2], att4:attribute_row13[3], att5:attribute_row13[4]};
        attr14={att1:attribute_row14[0], att2:attribute_row14[1], att3:attribute_row14[2], att4:attribute_row14[3], att5:attribute_row14[4]};
        attr15={att1:attribute_row15[0], att2:attribute_row15[1], att3:attribute_row15[2], att4:attribute_row15[3], att5:attribute_row15[4]};
	
    var ajax_data;
//	ajax row data
	ajax_data = 
			[
				attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8,attr9,attr10,attr11,attr12,attr13,attr14,attr15

			]
	
	
	var random_id = function  () 
	{
		var id_num = Math.random().toString(9).substr(2,3);
		var id_str = Math.random().toString(36).substr(2);
		
		return id_num + id_str;
	}

	//--->create data table > start
	var tbl = '';
	tbl +='<table class="table table-hover">'

		//--->create table header > start
		tbl +='<thead>';
			tbl +='<tr>';
			tbl +='<th></th>';
			tbl +='<th></th>';
			tbl +='<th></th>';
			tbl +='<th></th>';
			tbl +='<th></th>';
			tbl +='</tr>';
		tbl +='</thead>';
		//--->create table header > end

		
		//--->create table body > start
		tbl +='<tbody>';

			//--->create table body rows > start
			$.each(ajax_data, function(index, val) 
			{
				//you can replace with your database row id
				var row_id = random_id();

				//loop through ajax row data
				tbl +='<tr row_id="'+row_id+'">';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="att1">'+val['att1']+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="att2">'+val['att2']+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="att3">'+val['att3']+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="att4">'+val['att4']+'</div></td>';
					tbl +='<td ><div class="row_data" edit_type="click" col_name="att5">'+val['att5']+'</div></td>';
		
					//--->edit options > start
					tbl +='<td>';
					 
						tbl +='<span class="btn_edit" > <a href="#" class="btn btn-link " row_id="'+row_id+'" > Edit</a> </span>';

						//only show this button if edit button is clicked
						tbl +='<span class="btn_save"> <a href="#" class="btn btn-link"  row_id="'+row_id+'"> Save</a> | </span>';
						tbl +='<span class="btn_cancel"> <a href="#" class="btn btn-link" row_id="'+row_id+'"> Cancel</a> | </span>';

					tbl +='</td>';
					//--->edit options > end
					
				tbl +='</tr>';
			});

			//--->create table body rows > end

		tbl +='</tbody>';
		//--->create table body > end

	tbl +='</table>'	
	//--->create data table > end

	//out put table data
	$(document).find('.tbl_user_data').html(tbl);

	$(document).find('.btn_save').hide();
	$(document).find('.btn_cancel').hide(); 


	//--->make div editable > start
	$(document).on('click', '.row_data', function(event) 
	{
		event.preventDefault(); 

		if($(this).attr('edit_type') == 'button')
		{
			return false; 
		}

		//make div editable
		$(this).closest('div').attr('contenteditable', 'true');
		//add bg css
		$(this).addClass('bg-warning').css('padding','5px');

		$(this).focus();
	})	
	//--->make div editable > end


	//--->save single field data > start
	$(document).on('focusout', '.row_data', function(event) 
	{
		event.preventDefault();

		if($(this).attr('edit_type') == 'button')
		{
			return false; 
		}

		var row_id = $(this).closest('tr').attr('row_id'); 
		
		var row_div = $(this)				
		.removeClass('bg-warning') //add bg css
		.css('padding','')

		var col_name = row_div.attr('col_name'); 
		var col_val = row_div.html(); 

		var arr = {};
		arr[col_name] = col_val;

		//use the "arr"	object for your ajax call
		$.extend(arr, {row_id:row_id});

		//out put to show
		$('.post_msg').html( '<pre class="bg-success">'+JSON.stringify(arr, null, 2) +'</pre>');
		
	})	
	//--->save single field data > end

 
	//--->button > edit > start	
	$(document).on('click', '.btn_edit', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		tbl_row.find('.btn_save').show();
		tbl_row.find('.btn_cancel').show();

		//hide edit button
		tbl_row.find('.btn_edit').hide(); 

		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('contenteditable', 'true')
		.attr('edit_type', 'button')
		.addClass('bg-warning')
		.css('padding','3px')

		//--->add the original entry > start
		tbl_row.find('.row_data').each(function(index, val) 
		{  
			//this will help in case user decided to click on cancel button
			$(this).attr('original_entry', $(this).html());
		}); 		
		//--->add the original entry > end

	});
	//--->button > edit > end


	//--->button > cancel > start	
	$(document).on('click', '.btn_cancel', function(event) 
	{
		event.preventDefault();

		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		//hide save and cacel buttons
		tbl_row.find('.btn_save').hide();
		tbl_row.find('.btn_cancel').hide();

		//show edit button
		tbl_row.find('.btn_edit').show();

		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('edit_type', 'click')
		.removeClass('bg-warning')
		.css('padding','') 

		tbl_row.find('.row_data').each(function(index, val) 
		{   
			$(this).html( $(this).attr('original_entry') ); 
		});  
	});
	//--->button > cancel > end

	
	//--->save whole row entery > start	
	$(document).on('click', '.btn_save', function(event) 
	{
		event.preventDefault();
		var tbl_row = $(this).closest('tr');

		var row_id = tbl_row.attr('row_id');

		
		//hide save and cacel buttons
		tbl_row.find('.btn_save').hide();
		tbl_row.find('.btn_cancel').hide();

		//show edit button
		tbl_row.find('.btn_edit').show();


		//make the whole row editable
		tbl_row.find('.row_data')
		.attr('edit_type', 'click')
		.removeClass('bg-warning')
		.css('padding','') 

		//--->get row data > start
		var arr = {}; 
		tbl_row.find('.row_data').each(function(index, val) 
		{   
			var col_name = $(this).attr('col_name');  
			var col_val  =  $(this).html();
			arr[col_name] = col_val;
		});
		//--->get row data > end

		//use the "arr"	object for your ajax call
		$.extend(arr, {row_id:row_id});

		//out put to show
		$('.post_msg').html( '<pre class="bg-success">'+JSON.stringify(arr, null, 2) +'</pre>')
		 

	});
	//--->save whole row entery > end


});
}
</script>

<div class="panel panel-default">
  <div class="panel-heading"><b> Demo </b> </div>

  <div class="panel-body">
	
	<div class="tbl_user_data"></div>

  </div>

</div>

<br>

<div class="form-group">
	<span>
     	<button class="btn btn-primary"  type="submit" onclick="addAttribute()" id="attributeAdd" data-toggle="tooltip" title="Add Attribute">Add Attribute</button>
	</span>

 	<span>
     	<button class = "btn btn-link" type="button" onclick="window.location.reload(true)" data-toggle="tooltip" title="Cancels adding the Attribute, and refreshes this webpage.">Cancel</button>
   	</span>
</div>   
 
<table class = "table table-hover">
    <thead id="dataBody">
    <tr>
        <th>Name</th>
        <th>Attribute1</th>
        <th>Attribute2</th>
        <th>Attribute3</th>
        <th>Attribute4</th>
        <th>Attribute5</th>
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
</div>
    
<!-- <div id="deleteArticleModal" class="modal fade" tabindex="-1"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<h5 class="modal-title">Confirmation</h5> -->
<!-- 				<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 			</div> -->
<!-- 			<div class="modal-body"> -->
<!-- 			<p class="text-secondary">Are you sure you want to delete this Article?</p> -->
<!-- 			<label>ID</label> -->
<!-- 			<p id='attribute1' class="text-secondary"></p> -->
<!-- 			<label>Name</label> -->
<!-- 			<p id='attribute2' class="text-secondary"></p> -->
<!-- 			</div> -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button> -->
<!-- 				<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="deleteArticle()">Delete</button> -->
<!-- 			</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- </div> -->

    