<%@include file=".\includes\adminHeader.jsp" %>

<%@include file=".\includes\adminNavigation.jsp" %>

<div class="container-fluid"> 

<%
	if(view == null){
		view = "";
	}
	if(view.equals("predictionModel")){%>
	<%@include file=".\includes\predictionModel.jsp" %>
		<%}else if(view.equals("howTo")){ %>
	<%@include file=".\includes\howTo.jsp" %>
		<%}else if(view.equals("about")){ %>
	<%@include file=".\includes\About.jsp" %>
			<%}else if(view.equals("upload_page")){ %>
	<%@include file=".\includes\upload_page.jsp" %>
			<%}else if(view.equals("topdataset")){ %>
	<%@include file=".\includes\topDataset.jsp" %>
				<%}else if(view.equals("frameworks")){ %>
	<%@include file=".\includes\topFrameworks.jsp" %>
				<%}else if(view.equals("projects")){ %>
	<%@include file=".\includes\projectsSENG.jsp" %>
		<%}else{ %>
		<%@include file=".\includes\dashboard.jsp" %>
		<%} %>
	
</div>
<!-- /.container-fluid -->

<%@include file=".\includes\adminFooter.jsp" %>