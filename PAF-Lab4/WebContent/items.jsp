<%@page import="com.PAF.Item"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%

//Insert item----------------------------------
if (request.getParameter("ItemCode") != null)
	
 {
 		Item itemObj = new Item();
 		
 		String stsMsg = itemObj.insertItem(request.getParameter("ItemCode"),	
 					request.getParameter("ItemName"),
 					request.getParameter("ItemPrice"),
 					request.getParameter("ItemDesc"));
 		
 		session.setAttribute("statusMsg", stsMsg);
 }



//Delete item----------------------------------
if (request.getParameter("itemID") != null)

  {
	
		Item itemObj = new Item();
		
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		
		session.setAttribute("statusMsg", stsMsg);

} 

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<title>Items Management</title>
</head>
<body>

 <div class="container">
 <div class="row">
 <div class="col">

<h1>Items Management</h1>
<form method="post" action="items.jsp">
 		Item code: <input name="ItemCode" type="text" class="form-control"><br>
 		Item name: <input name="ItemName" type="text" class="form-control"><br>
 		Item price: <input name="ItemPrice" type="text" class="form-control"><br>
 		Item description: <input name="ItemDesc" type="text" class="form-control"><br>
 		<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary"> 
</form>


<div class="alert alert-success">
<% out.print(session.getAttribute("statusMsg"));%>
</div>

		<br>
<%
		Item itemObj = new Item();
 		out.print(itemObj.readItems());
%>

</div>
</div>
</div>
</body>
</html>

