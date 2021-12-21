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
<style type="text/css">
a:link {
	color: #000;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #000;
}

a:hover {
	text-decoration: none;
	color: #000;
}

a:active {
	text-decoration: none;
	color: #000;
	font-size: 10px;
}
.jbFixed {
	position: fixed;
	top: 0px;
	opacity: 0.85;
	z-index: 999999;
}
</style>
<link href="joinpage.css" rel="stylesheet" type="text/css" />

 <script>
 function check_pw(){
	 
     var password = document.getElementById('password').value;
     var SC = ["!","@","#","$","%","^"];
     var check_SC = 0;

     if(password.length < 6 || password.length>16){
         document.getElementById('pw_pro_label').innerHTML ='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
         document.getElementById('pw_pro').value='0';
         return;
     }
     for(var i=0;i<SC.length;i++){
         if(password.indexOf(SC[i]) != -1){
             check_SC = 1;
         }
     }
     if(check_SC == 0){
         document.getElementById('pw_pro_label').innerHTML = '비밀번호에 !,@,#,$,% 의 특수문자를 포함시켜야 합니다.'
         return;
     }
     document.getElementById('pw_pro_label').innerHTML = '';
     if(password.length < 8){
         document.getElementById('pw_pro').value='1';
     }
     else if(password.length<12){
         document.getElementById('pw_pro').value='2';
     }
     else{
         document.getElementById('pw_pro').value='3';
     }
     if(document.getElementById('password').value !='' && document.getElementById('password2').value!=''){
         if(document.getElementById('password').value==document.getElementById('password2').value){
             document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
             document.getElementById('check').style.color='blue';
         }
         else{
             document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
             document.getElementById('check').style.color='red';
         }
     }
 }
    
	function winopen() {
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		//1. 아이디가 없으면 알림창과 진행x
		if (document.fr.mid.value == "" || document.fr.mid.value.length < 0) {
			alert("아이디를 먼저 입력해주세요")
			document.fr.mid.focus();
		} else {
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("joinIdCheck.jsp?mid=" + document.fr.mid.value, "",
					"width=500, height=300");
		}
	}
</script>


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
		<div id="header_exchange">
			<div align="center">
				<div style="cursor: pointer;"
					onclick="location.href='returnpage.html';">-교환
					반품 시 필독사항</div>
			</div>
		</div>
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
								<li><a href="outer.jsp?menu=슬랙스">슬랙스</a></li>
								<li><a href="outer.jsp?menu=데님">데님</a></li>
								<li><a href="outer.jsp?menu=면팬츠">면팬츠</a></li>
							</ul></li>
						<li><a href="outer.jsp?menu=트레이닝복">트레이닝복</a></li>
					</ul>
				</div>
			</div>
			<div id="page_right_menu">
				<%
					String login = (String) session.getAttribute("LOGIN");
				if (login == null) {
				%>
				<div align="center">
					<a href='loginpage.jsp'>로그인</a> 　<a href='joinpage.jsp'>회원가입</a> 　<a href='mypage.jsp'>마이페이지</a>
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

		<div id="main">
			<div id="main_title">
				<div align="center">
					<p>
						&nbsp;
					</p>
					<p>JOIN US</p>
				</div>
			</div>
			<form id="fr" name="fr" method="post" action="join.jsp">
				<table width="200" border="0" align="center" cellpadding="1"
					cellspacing="20">
					<tr>
						<td width="133">아이디</td>
						<td width="591"><label for="idfield"></label> <input
							type="text" name="mid" id="mid" /> (영문소문자/숫자, 4~16자)</td>
						<td><input type="button" name="logincheck" id="logincheck" value="중복확인" onclick="winopen()" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><label for="password"></label> <input type="password" name="password" id="password" onchange="check_pw()" /> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자) &nbsp;<span style="color:cadetblue">보안성</span> <progress id="pw_pro" value="0" max="3"></progress>&nbsp;<span id="pw_pro_label"></span></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><label for="password"></label> <input type="password" name="password2" id="password2" onchange="check_pw()" /> &nbsp;<span id="check"></span></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><label for="namefield"></label> <input type="text"
							name="mname" id="namefield" /></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><label for="telfield"></label> <input type="text"
							name="mtel" id="telfield" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><label for="emailfield"></label> <input type="text"
							name="email" id="emailfield" /> <label for="mailsel"></label></td>
					</tr>
					<tr>
						<td>sns 수신동의여부</td>
						<td>
							<p>
								<label> <input type="radio" name="sns_yn" value="Y"
									id="snsyn_0" /> 동의
								</label> <label> <input type="radio" name="sns_yn" value="N"
									id="snsyn_1" /> 비동의
								</label> <br />
							</p>
						</td>
					</tr>
					<tr>
						<td>E-mail 수신동의여부</td>
						<td>
							<p>
								<label> <input type="radio" name="email_yn" value="Y"
									id="emailyn_0" /> 동의
								</label> <label> <input type="radio" name="email_yn" value="N"
									id="emailyn_1" /> 비동의
								</label> <br />
							</p>
						</td>
					</tr>
					<tr>
				
						<td colspan="2">
							<div align="center">
								<input name="submit" type="submit" class="submit" id="submit"
									value="SUBMIT" />
							</div>
						</td>
						
					</tr>
				</table>
			</form>

		</div>
	</div>

	<div id="footer">
		<div id="footer_copyright">
			<h3>COMPANY. 히즈배드</h3>
			owner. 오승엽  tel. 010-5584-6654 business no. 202-16-24439 <br /> mail
			order license. 제2021-창원의창-0079호 <a
				href="https://heisgood.co.kr/#none"
				onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2021624439', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a><br />
			personal info manager. 정찬호 (dkzn3557@naver.com)<br /> address.
			[51433] 경기도 시흥시 산기대학로 237 종합관 4층<br />
			<p>
				copyright © <strong>히즈배드</strong> all rights reserved / published by
				plain design
			</p>
		</div>
		<div class="footer_ban">
			<h3>CUSTOMER CENTER</h3>
			<h4>070-8624-3557</h4>
			평일(월-금)10:00am-5:00pm 점심 12:00pm~1:00pm 토요일,일요일,공휴일 휴무
		</div>
		<div class="footer_ban">
			<h3>BANK ACCOUNT</h3>
			<p>신한 110-506-685632</p>
			<p>예금주:김성욱(히즈굿)</p>
		</div>
		<div class="footer_ban">
			<h3>[교환/반품 주소]</h3>
			<p>서울시 중구 다산로 38길 12 4층 히즈굿</p>
			<u>* 공지사항 및 이용안내를 참고하여 지정택배사(CJ택배 1588-1255)로 이용해주세요.</u>
		</div>
		<div class="footer_ban">
			<h3>SERVICE</h3>
			<p>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰 에서 가입한 구매안전 서비스를 이용하실 수 있습니다.</p>
		</div>
		<div id="footer_bottom">
			<a href="main.jsp">홈으로</a> | <a
				href="https://heisgood.co.kr/shopinfo/company.html">회사소개</a> | <a
				href="https://heisgood.co.kr/member/agreement.html">이용약관</a> | <a
				href="https://heisgood.co.kr/member/privacy.html">개인정보취급방침</a> | <a
				href="https://heisgood.co.kr/shopinfo/guide.html"> 이용안내</a> | <a
				href="https://heisgood.co.kr/board/qa/6/">고객센터</a> | <a
				href="https://heisgood.co.kr/board/index.html">자주묻는질문</a>
		</div>
	</div>

</body>
</html>
