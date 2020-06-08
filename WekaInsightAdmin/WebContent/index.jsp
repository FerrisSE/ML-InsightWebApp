<%@include file=".\includes\adminHeader.jsp" %>

<%@include file=".\includes\adminNavigation.jsp" %>

<div class="container-fluid"> 

<%
	if(view == null){
		view = "";
	}
	if(view.equals("articlelist")){%>
		<%@include file=".\includes\articleList.jsp" %>
	<%}else if(view.equals("articleadd")){ %>
		<%@include file=".\includes\articleAdd.jsp" %>
	<%}else if(view.equals("articleedit")){ %>
		<%@include file=".\includes\articleEdit.jsp" %>
			<%}else if(view.equals("attributelist")){ %>
		<%@include file=".\includes\attributeList.jsp" %>
			<%}else if(view.equals("attedit")){ %>
		<%@include file=".\includes\attributeEdit.jsp" %>
			<%}else if(view.equals("categorylist")){ %>
		<%@include file=".\includes\categoryList.jsp" %>
			<%}else if(view.equals("catedit")){ %>
		<%@include file=".\includes\categoryEdit.jsp" %>
					<%}else if(view.equals("userlist")){ %>
		<%@include file=".\includes\userList.jsp" %>
			<%}else if(view.equals("useredit")){ %>
		<%@include file=".\includes\userEdit.jsp" %>
			<%}else if(view.equals("useradd")){ %>
		<%@include file=".\includes\userAdd.jsp" %>
			<%}else if(view.equals("charts")){ %>
	<%@include file=".\includes\charts.jsp" %>
		<%}else if(view.equals("about")){ %>
	<%@include file=".\includes\About.jsp" %>
		<%}else{ %>
		<%@include file=".\includes\dashboard.jsp" %>
		<%} %>
	
</div>
<!-- /.container-fluid -->

<%@include file=".\includes\adminFooter.jsp" %>