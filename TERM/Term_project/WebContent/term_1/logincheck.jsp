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
	String password = request.getParameter("password");
	Connection conn = ConnectionProvider.getConnection();
	boolean login = true;
	try {
		MemberDao dao = new MemberDao();
		login = dao.checkPassword(conn, mid, password);
	} catch (SQLException e) {
	}
	if (login) {
		session.setAttribute("LOGIN", mid);
		if (mid.equals("admin")) {
			response.sendRedirect("admin.jsp");
		} else {
			response.sendRedirect("main.jsp");
		}
	} else {
	%>
	<script>
		alert("로그인 아이디와 패스워드가 틀립니다.");
		location.href = "loginpage.jsp";
	</script>
	<%
		}
	%>
</body>
</html>