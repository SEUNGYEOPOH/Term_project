<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String mid = request.getParameter("mid");
	Connection conn = ConnectionProvider.getConnection();
	
	try{
		MemberDao member = new MemberDao();
		member.deleteById(conn, mid);
	} catch(SQLException e){
		
	}
%>
<script>
location.href="membermanagementpage.jsp";
</script>
</body>
</html>