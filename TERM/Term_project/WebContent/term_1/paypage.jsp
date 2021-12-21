<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<style>
.jbFixed {
	position: fixed;
	top: 0px;
	opacity: 0.85;
	z-index: 999999;
}
</style>
<link href="paypage.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
	
function payBuyNow(){
		var total_amount = document.getElementById("amount2").value * document.getElementById("price").value ;
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : '주문명:결제테스트',
			//결제창에서 보여질 이름
			amount : total_amount,
			//가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			// location.href="ordercom.jsp"
			post_to_url();
		});
	}
	
	//function sendData(id){
		//post_to_url("ordercom.jsp",{'id':id,'pass':deleteapss});
	//}
	
	function post_to_url(){
		var address = document.getElementById("member_post").value + document.getElementById("member_addr").value+document.getElementById("member_detail_address").value
		var path = "ordercom.jsp";
		method = "post";
		var form = document.createElement("form");
		form.setAttribute("method",method)
		form.setAttribute("action",path)
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type","hidden");
		hiddenField.setAttribute("name","address");
		hiddenField.setAttribute("value",address);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
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
		<div id="page_header" class="jbMenu">
			<div id="page_header_logo">
			<a href="main.jsp">
				<img src="webimages/page_header/Logo_03.png" width="200"
					height="100" /></a>
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
				<div align="center">
					<%
						String login = (String) session.getAttribute("LOGIN");
					if (login == null) {
					%>
					<div align="center">
						<a href='loginpage.jsp'>로그인</a> 　　<a href='joinpage.jsp'>회원가입</a>  　<a href='mypage.jsp'>마이페이지</a>
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
		<%
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionProvider.getConnection();
		int amount = 0;
		amount = Integer.parseInt(request.getParameter("amount"));
		Product product = null;
		Member member = null;

		int pid = Integer.parseInt(request.getParameter("pid"));
		String pcolor = (String) request.getParameter("pcolor");
		int total_price = Integer.parseInt(request.getParameter("price"));
		
		
		session.setAttribute("pid", pid );
		session.setAttribute("amount", amount );
		session.setAttribute("pcolor", pcolor );
		session.setAttribute("total_price", total_price );
		
		
		try {
			ProductDao dao = new ProductDao();
			product = dao.selectById(conn, pid);
			MemberDao mdao = new MemberDao();
			member = mdao.selectById(conn, login);
		} catch (Exception e) {
		}
		if (product != null) {
		%>
		
		<div id="main">
			<div id="pay_title">

				<div align="center">
					<strong>ORDER / PAYMENT</strong>
				</div>

			</div>
			<div id="product_info">
		
				<table width="200" border="0" cellspacing="10" cellpadding="1">
					<tr>
						<td width="516" height="42"><div align="center">상품명</div></td>
						<td width="132"><div align="center">수량</div></td>
						<td width="134"><div align="center">배송비</div></td>
						<td width="260"><div align="center">상품금액</div></td>
					</tr>
					<tr>
						<td><div align="center">
								<div id="product_image">
									<img src="webimages/main_image/<%=product.getPimage()%>"
										width="120" height="120" />
								</div>
								<div id="product_detail"><%=product.getPname()%></div>
							</div></td>
						<td><div align="center"><%=amount%></div></td>
						<td><div align="center">배송비</div></td>
						<td><div align="center"><%=product.getPrice()%></div></td>
					</tr>
				</table>
				<%
					}
				%>
				
			</div>
			<div id="order_title">
				<strong>배송지 입력</strong>
			</div>
			<div id="order">
			
				<table width="800" border="0" cellspacing="10" cellpadding="1">
				
					<tr>
						<td>
						
						<table width="800" border="0" cellspacing="10"
								cellpadding="1">
								<tr>
									<td width="145">수령인</td>
									<td width="617"><input id="rpeople" type="text"
										placeholder="수령인" /></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input id="snumber" type="text" placeholder="수령인 전화번호" />
									<input type="hidden" name="pid" id="pid" value="<%=pid %>" />
									<input type="hidden" name="amount" id="amount2" value="<%=amount %>" />
									<input type="hidden" name="price" id="price" value="<%=product.getPrice() %>" />
									<input type="hidden" name="email" id="email" value="<%=member.getEmail() %>" />
									<input type="hidden" name="mtel" id="mtel" value="<%=member.getMtel() %>" />
									<input type="hidden" name="mname" id="mname" value="<%=member.getMname() %>" /> 
									</td>
								</tr>
								<tr>
									<td rowspan="3">배송지 주소</td>
									<td><input id="member_post" type="text" placeholder="우편번호"
										readonly onclick="findAddr()" /></td>
								</tr>
								<tr>
									<td><input id="member_addr" type="text"
										placeholder="도로명주소" readonly /></td>
								</tr>
								<tr>
									<td><input type="text" id = "member_detail_address" placeholder="상세주소" /></td>
								</tr>
								<tr>
									<td>배송 메모</td>
									<td><label for="memo"></label> <select name="memo"
										id="memo">
											<option value="배송 시 요청사항을 선택해주세요" selected="selected">배송
												시 요청사항을 선택해주세요</option>
											<option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
											<option value="부재 시 택배함에 넣어주세요">부재 시 택배함에 넣어주세요</option>
											<option value="부재 시 집 앞에 놔주세요">부재 시 집 앞에 놔주세요</option>
											<option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
											<option value="파손의 위험이 있는 상품입니다 배송 시 주의해주세요">파손의 위험이
												있는 상품입니다 배송 시 주의해주세요</option>
									</select></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<div id="button_div">
				<input type="button" name="buy" id="check_module" value="BUY NOW"  onclick="payBuyNow()"/> 
			</div>


		</div>

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
