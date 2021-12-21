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
	
	int pid = Integer.parseInt(request.getParameter("pid"));
	Connection conn = ConnectionProvider.getConnection();
	
	try{
		ProductDao dao = new ProductDao();
		dao.deleteById(conn, pid);
	} catch(SQLException e){
		
	}
%>
<script>
location.href="uploadlist.jsp";
</script>
</body>
</html>