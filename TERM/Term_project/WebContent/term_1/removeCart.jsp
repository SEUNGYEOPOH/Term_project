<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String pid = request.getParameter("pid");
	System.out.println(pid);
	session.removeAttribute(pid);
	
%>
<script>
location.href="cartlist.jsp";
</script>
</body>
</html>