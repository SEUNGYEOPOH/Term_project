<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<title>무제 문서</title>
<link href="updatepage.css" rel="stylesheet" type="text/css" />
<style>
.jbFixed {
	position: fixed;
	top: 0px;
	opacity: 0.85;
	z-index: 999999;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var jbOffset = $('.jbMenu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.jbMenu').addClass('jbFixed');
			} else {
				$('.jbMenu').removeClass('jbFixed');
			}
		});
	});
	function MM_effectAppearFade(targetElement, duration, from, to, toggle) {
		Spry.Effect.DoFade(targetElement, {
			duration : duration,
			from : from,
			to : to,
			toggle : toggle
		});
	}
	$(document).ready(function() {
		var imgs;
		var img_count;
		var img_position = 1;

		imgs = $(".slide ul");
		img_count = imgs.children().length;

		//버튼을 클릭했을 때 함수 실행
		$('#back').click(function() {
			back();
		});
		$('#next').click(function() {
			next();
		});

		function back() {
			if (1 < img_position) {
				imgs.animate({
					left : '+=1300px'
				});
				img_position--;
			}
		}
		function next() {
			if (img_count > img_position) {
				imgs.animate({
					left : '-=1300px'
				});
				img_position++;
			}
		}

		//이미지 끝까지 가면 버튼 사라지기

		//첫 이미지로 돌아오기

	});
</script>
</head>

<body>
	<div id="wrap">
		<div id="page_header" class="jbMenu">
			<div id="page_header_logo">
					<a href="main.jsp"><img src="webimages/page_header/Logo_03.png"
					width="200" height="100" /></a>
			</div>
			<div id="menubar">
				<div id="menu">
				<ul>
						<li><a href="newpage.jsp?menu=">NEW</a></li>
						<li><a href="outer.jsp?menu=아우터">아우터</a>
							<ul>
								<li><a href="outer.jsp?menu=아우터&menu_detail=코트">코트</a></li>
								<li><a href="outer.jsp?menu=아우터&menu_detail=자켓/점퍼">자켓/점퍼</a></li>
								<li><a href="outer.jsp?menu=아우터&menu_detail=가디건">가디건</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=상의">상의</a>
							<ul>
								<li><a href="outer.jsp?menu=상의&menu_detail=니트">니트</a></li>
								<li><a href="outer.jsp?menu=상의&menu_detail=긴팔티">긴팔티</a></li>
								<li><a href="outer.jsp?menu=상의&menu_detail=맨투맨/후드티">맨투맨/후드티</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=셔츠">셔츠</a>
							<ul>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=무지">무지</a></li>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=체크">체크</a></li>
								<li><a href="outer.jsp?menu=셔츠&menu_detail=스트라이프/패턴">스트라이프/패턴</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=수트">수트</a>
							<ul>
								<li><a href="outer.jsp?menu=수트&menu_detail=SUIT">SUIT</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=하의">하의</a>
							<ul>
								<li><a href="outer.jsp?menu=하의&menu_detail=슬랙스">슬랙스</a></li>
								<li><a href="outer.jsp?menu=하의&menu_detail=데님">데님</a></li>
								<li><a href="outer.jsp?menu=하의&menu_detail=면팬츠">면팬츠</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=트레이닝복">트레이닝복</a></li>
					</ul>
				</div>

			</div>
			<div id="page_right_menu">
				<div align="center">
						<%
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
					<a href='mypage.jsp'>마이페이지</a>
				</div>
				<%
					}
				%>
				</div>
			</div>
		</div>
		<div id="main">
			<div id="update_title">
				<div align="center">상품 정보 수정</div>
			</div>
			<%
        int pid = Integer.parseInt(request.getParameter("pid"));
        Connection conn = ConnectionProvider.getConnection();
        Product product = null;
        try {
           ProductDao dao = new ProductDao();
           product = dao.selectById(conn, pid);
        } catch(SQLException e) {}
        if (product != null) {
        %>
			<c:set var="p" value="<%=product %>" />
			<form action="update.jsp" method="post" enctype="multipart/form-data"
				name="form1">
				<table width="800" border="0" cellspacing="10" cellpadding="1">
					<tr>
						<td width="178">상품번호</td>
						<td width="384"><label for="idfield"></label> <input
							type="text" name="pid" id="idfield" value="${p.pid}" /></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><label for="namefield"></label> <input type="text"
							name="pname" id="namefield" value="${p.pname}" /></td>
					</tr>
					<tr>
						<td>상품색상</td>
						<td><label for="colorfield"></label> <input type="text"
							name="pcolor" id="colorfield" value="${p.pcolor}" /></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><label for="pricefield"></label> <input type="text"
							name="price" id="pricefield" value="${p.price}" /></td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td><label for="imagefield"></label> <input type="file"
							name="pimage" id="imagefield" value="${p.pimage}" /></td>
					</tr>
					<tr>
						<td>상품 카테고리</td>
						<td><label for="categoryfield"></label> <input type="text"
							name="menu" id="categoryfield" value="${p.menu}" /></td>
					</tr>
					<tr>
						<td>상품 상세 카테고리</td>
						<td><label for="detailfield"></label> <input type="text"
							name="menu_detail" id="detailfield" value="${p.menu_detail}" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" name="update" id="update" value="확인" /> <input
									type="submit" name="update" id="update" value="취소" />
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<% } %>
		<div id="footer">
			<div id="footer_copyright">
				<h3>COMPANY. 히즈배드</h3>
				owner. 오승엽 tel. 010-5584-6654 business no. 202-16-24439 mail order
				license. 제2021-창원의창-0079호 <a href="https://heisgood.co.kr/#none"
					onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2021624439', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a>
				personal info manager. 정찬호 (dkzn3557@naver.com) address. [51433] 경기도
				시흥시 산기대학로 237 종합관 4층
				<p>
					copyright © <strong>히즈배드</strong> all rights reserved / published
					by plain design
				</p>
			</div>
			<div class="footer_ban">
				<h3>CUSTOMER CENTER</h3>
				<h4>010-3294-3839</h4>
				평일(월-금)10:00am-5:00pm 점심 12:00pm~1:00pm 토요일,일요일,공휴일 휴무
			</div>
			<div class="footer_ban">
				<h3>BANK ACCOUNT</h3>
				<p>우리 1002-124-285706</p>
				<p>예금주:정찬호(히즈배드)</p>
			</div>
			<div class="footer_ban">
				<h3>[교환/반품 주소]</h3>
				<p>경기도 시흥시 산기대학로 237 종합관 4층</p>
				<u>* 공지사항 및 이용안내를 참고하여 지정택배사(CJ택배 1588-1255)로 이용해주세요.</u>
			</div>
			<div class="footer_ban">
				<h3>SERVICE</h3>
				<p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰 에서 가입한 구매안전 서비스를 이용하실 수 있습니다.</p>
			</div>
			<div id="footer_bottom">
				<a href="https://heisgood.co.kr/">홈으로</a> | <a
					href="https://heisgood.co.kr/shopinfo/company.html">회사소개</a> | <a
					href="https://heisgood.co.kr/member/agreement.html">이용약관</a> | <a
					href="https://heisgood.co.kr/member/privacy.html">개인정보취급방침</a> | <a
					href="https://heisgood.co.kr/shopinfo/guide.html"> 이용안내</a> | <a
					href="https://heisgood.co.kr/board/qa/6/">고객센터</a> | <a
					href="https://heisgood.co.kr/board/index.html">자주묻는질문</a>
			</div>
		</div>
	</div>
</body>
</html>
