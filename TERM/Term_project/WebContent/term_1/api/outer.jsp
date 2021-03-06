<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="listproduct.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap"><div id="page_header">
  <div id="page_header_logo"><img src="webimages/page_header/Logo_03.png" width="200" height="100" /></div>
    <div id="menubar"><div id="menu">
	<ul>
		<li><a href="#">NEW</a>
		</li>
		<li><a href="#">아우터</a>
			<ul>
				<li><a href="#">코트</a></li>
				<li><a href="#">자켓/점퍼</a></li>
				<li><a href="#">가디건</a></li>
			</ul>
		</li>
		<li><a href="#">상의</a>
			<ul>
				<li><a href="#">니트</a></li>
				<li><a href="#">긴팔티</a></li>
				<li><a href="#">맨투맨/후드티</a></li>
			</ul>
		</li>
		<li><a href="#">셔츠</a>
			<ul>
				<li><a href="#">무지</a></li>
				<li><a href="#">체크</a></li>
				<li><a href="#">스트라이프/패턴</a></li>
			</ul>
		</li>
		<li><a href="#">수트</a>
			<ul>
				<li><a href="#">SUIT</a></li>
			</ul>
		</li>
        <li><a href="#">하의</a>
			<ul>
				<li><a href="#">슬랙스</a></li>
				<li><a href="#">데님</a></li>
				<li><a href="#">면팬츠</a></li>
			</ul>
		</li>
        <li><a href="#">트레이닝복</a>
		</li>
	</ul>
</div>
      
    </div>
    <div id="page_right_menu">
      <div align="center">
        <p>&nbsp;</p>
        <p>				<%
					String login = (String) session.getAttribute("LOGIN");
				if (login == null) {
				%>
				<div align="center">
					<a href='loginpage.jsp'>로그인</a> <a href='joinpage.jsp'>회원가입</a>
				</div>
				<%
					} else {
				%>
				<div align="center">
					<a href='logout.jsp'>로그아웃</a>
				</div>
				<%
					}
				%></p>
        
      </div>
    </div>
  </div>
  <div id="main">
         <div class="searchproduct">  <form action = "" method="post">
                    	<select name="target">
                    		<option value="pname">제품명</option>
                    		<option value="pid">제품아이디</option>
                    		<option value="pimage">제품이미지</option>
                    	</select>
                    	<input type="text" name="keyword"/>
                    	<input type="submit" value="검색"/>
                    </form>
                    </div>
		<%
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionProvider.getConnection();
		List<Product> products = null;
		//List<Product> productList = null;
		String menu = request.getParameter("menu");
		String menuDetail = null;
		String target = request.getParameter("target");
		String keyword = request.getParameter("keyword");
		try {
			ProductDao dao = new ProductDao();
			//productList = dao.selectListDetail(conn, menu, menuDetail);
			if (target == null || target.length()==0)
			products = dao.selectList(conn);
			else
				products = dao.selectLike(conn, target, keyword);
			} catch (SQLException e) {}
			if (products != null) {
		%>
                    
    <div id="list_title">
      <div align="center">아우터 </div>
    </div>
    <div id="list_category">
      <div align="center"><a href="#">ALL | 코트</a> | <a href="#">자켓/점퍼</a> | <a href="#">가디건</a></div>
      
    </div>
    <%request.setCharacterEncoding("utf-8"); %>
 <c:forEach var = "product" items="<%= products %>">

    <div class="ban">
    <a href="detailpage.jsp?pid=${product.pid}"><img
	src="webimages/new_arrival/${product.pimage}" width="426" height="497" /></a>
      <div class="ban_detail">
        <p align="center">${product.pname }</p>
     
        
            <div align="center">(free 95-105)</div>
         
            <div align="center"><strong>${product.price} won</strong></div>
      
      </div>
    </div>
    </c:forEach>
<%} %>

  <div id="footer">
    <div id="footer_copyright">
      <h3>COMPANY. 히즈배드</h3>
owner. 오승엽 tel. 010-5584-6654
      business no. 202-16-24439 mail order license. 제2021-창원의창-0079호 <a href="https://heisgood.co.kr/#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2021624439', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a> personal info manager. 정찬호 (dkzn3557@naver.com)
      address. [51433] 경기도 시흥시 산기대학로 237 종합관 4층
      <p>copyright © <strong>히즈배드</strong> all rights reserved / published by plain design</p>
    </div>
    <div class="footer_ban">
      <h3>CUSTOMER CENTER</h3>
      <h4>010-3294-3839</h4>
      평일(월-금)10:00am-5:00pm
      점심 12:00pm~1:00pm
      토요일,일요일,공휴일 휴무
    </div>
    <div class="footer_ban">
      <h3>BANK ACCOUNT</h3>
      <p>우리 1002-124-285706</p>
      <p>예금주:정찬호(히즈배드)</p>
    </div>
    <div class="footer_ban">
      <h3>[교환/반품 주소]</h3>
      <p>경기도 시흥시 산기대학로 237 종합관 4층</p>
    <u>* 공지사항 및 이용안내를 참고하여 지정택배사(CJ택배 1588-1255)로 이용해주세요.</u></div>
    <div class="footer_ban">
      <h3>SERVICE</h3>
      <p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰 에서 가입한 구매안전 서비스를 이용하실 수 있습니다.</p>
    </div>
    <div id="footer_bottom">　　　　<a href="https://heisgood.co.kr/">홈으로</a> | <a href="https://heisgood.co.kr/shopinfo/company.html">회사소개</a> | <a href="https://heisgood.co.kr/member/agreement.html">이용약관</a> | <a href="https://heisgood.co.kr/member/privacy.html">개인정보취급방침</a> | <a href="https://heisgood.co.kr/shopinfo/guide.html"> 이용안내</a> | <a href="https://heisgood.co.kr/board/qa/6/">고객센터</a> | <a href="https://heisgood.co.kr/board/index.html">자주묻는질문</a></div>
  </div></div>
</body>
</html>
