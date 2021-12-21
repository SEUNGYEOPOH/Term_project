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
<link href="ordercompletepage.css" rel="stylesheet" type="text/css" />
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
<div id="wrap"><div id="page_header">
  <div id="page_header_logo"><a href="main.jsp"><img src="webimages/page_header/Logo_03.png"
					width="200" height="100" /></a></div>
    <div id="menubar"><div id="menu">
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
        <p>&nbsp;</p>
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
       <%	request.setCharacterEncoding("utf-8"); %>
       <% 	String address = request.getParameter("address");
       int pid = (int) session.getAttribute("pid");
		int amount = (int) session.getAttribute("amount");
		String pcolor = (String) session.getAttribute("pcolor");
		int total_price = (int) session.getAttribute("total_price"); 
		Connection conn = ConnectionProvider.getConnection();
       try{
          
   		OrderDao odao = new OrderDao();
   		Order order = new Order(login, pid, new java.util.Date(), amount, address, pcolor, total_price);
   		odao.insert(conn, order);
   		} catch(Exception e){}
      
    %>	
        
      </div>
    </div>
  </div><div id="main">
    <div id="order_title">
      <div align="center"><strong> ORDER COMPLETE</strong> !</div>
    </div>
    <div id="order_box">
      <div class="title1"> 　주문 완료</div>
      <div id="box1">
        <table width="800" border="0" cellspacing="10" cellpadding="1">
          <tr>
            <td><div align="center">히즈배드를 이용해 주셔서 감사합니다.</div></td>
          </tr>
          <tr>
            <td><div align="center">고객님, <span class="point">주문이 완료</span>되었습니다.</div></td>
          </tr>
          <tr>
            <td><div align="center">주문내역 확인은 마이페이지에서 하실 수 있습니다</div></td>
          </tr>
        </table>
      </div>
      <div id="buttonbox">
        <input type="button" name="orderbutton" id="orderbutton" value="주문내역조회" onclick="location.href='mypage.jsp'" />
        <input type="button" name="gomain" id="gomain" value="메인으로" onclick="location.href='main.jsp'" />
      </div>
 
    </div>
  </div></div>
</body>
</html>
