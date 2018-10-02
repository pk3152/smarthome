<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>스마트홈 제어</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
	<link rel="stylesheet" href="resources/assets/css/custom.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="resources/assets/css/ie9.css" /><![endif]-->
	<noscript><link rel="stylesheet" href="resources/assets/css/noscript.css" /></noscript>
	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/skel.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo">

				<img src="resources/images/house.png" class="icon">

			</div>
			<div class="content">
				<div class="inner">
				<c:choose>
					<c:when test="${empty userID}">
						<h1>SMART HOME CONTROLL</h1>
						<p>원격제어 시스템을 통하여 원격으로 제어하자! </p>
					</c:when>
					<c:otherwise>
						<h1>${userID}님 어서오세요.</h1>	
						<h1>SMART HOME CONTROLL</h1>
						<p>원격제어 시스템을 통하여 원격으로 제어하자! </p>
					</c:otherwise>	
				</c:choose>	
				</div>
			</div>
			<!-- 메뉴바 클릭시 article 로 이동하여 해당 article 페이지 활성화 -->
			<nav>
				<ul>
				<c:choose>
					<c:when test="${empty userID}">
						<li><a href="#">거실</a></li>
						<li><a href="#">주방</a></li>
						<li><a href="#">화장실</a></li>
						<li><a href="#">CCTV</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#intro">거실</a></li>
						<li><a href="#work">주방</a></li>
						<li><a href="#about">화장실</a></li>
						<li><a href="#contact">CCTV</a></li>
					</c:otherwise>
				</c:choose>	
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Intro 거실 제어 페이지 -->
			<article id="intro">
				<h2 class="major">거실</h2>
				<span class="image main"><img src="resources/images/pic01.jpg" /></span>
				<div class="field half first">
					<label>거실등1</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
				<div class="field half">
					<label>거실등2</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
				<div class="field half first">
					<label>난방기 가동(온도입력)</label>
					<input type="text" name="temp" maxlength="2" />
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
			</article>
			
			<!-- Work 주방제어 페이지 -->
			<article id="work">
				<h2 class="major">주방</h2>
				<span class="image main"><img src="resources/images/pic02.jpg" alt="" /></span>
				<div class="field half first">
					<label>주방등</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>

				<div class="field half">
					<label>주방등2</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
			</article>

			<!-- About 화장실제어 페이지 -->
			<article id="about">
				<h2 class="major">화장실</h2>
				<span class="image main"><img src="resources/images/pic03.jpg" /></span>
				<div class="field half first">
					<label>화장실등</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
				<div class="field half">
					<label>환풍기 가동</label>
					<input type="button" value="ON" />
					<input type="button" value="OFF" />
				</div>
			</article>

			<!-- Contact 방1 제어 페이지 -->
			<article id="contact">
				<h2 class="major">CCTV</h2>
				<!-- 이부분에 iframe 태그를 써서 uv4l의 스트리밍 영상 가져올 예정. -->
				<span class="image main"><img src="resources/images/pic04.jpg" /></span>
				<div class="field half first">
					<label>CCTV 작업</label>
					<input type="button" value="CCTV캡쳐" />
					<input type="button" value="CCTV녹화" />
				</div>
			</article>

			<!-- login 로그인 페이지 -->
			<article id="login">
				<h2 class="major">로그인</h2>
				<form method="post" action="/login">
					<div class="field half first">
						<label for="ID">아이디</label>
						<input type="text" name="userID" id="ID" />
					</div>
					<div class="field half">
						<label for="Password">비밀번호</label>
						<input type="Password" name="userPW" id="PassWord" />
					</div>

					<ul class="actions">
						<li><input type="submit" value="로그인" class="special" /></li>
						
					</ul>
				</form>
			</article>

			<!-- join 회원가입 페이지  -->
			<article id="JOIN">
				<h2 class="major">회원가입</h2>
				<form method="post" action="/join">
					<div class="field">
						<label for="name">이름</label>
						<input type="text" name="userName" id="name" required />
					</div>
					<div class="field half first">
						<label for="userID">아이디</label>
						<input type="text" name="userID" id="userID" required />
					</div>
					<div class="field half">
						<label for="PassWord">비밀번호</label>
						<input type="Password" name="userPW" id="Password" required />
					</div>
					<div class="field">
						<label for="email">이메일주소</label>
						<input type="email" name="userEmail" id="email" style="background: transparent;" required />
					</div>

					<ul class="actions" style="text-align:right">
						<li><input type="reset" value="다시입력" /></li>
						<li><input type="submit" value="회원가입" class="special" /></li>
					</ul>
				</form>
			</article>
			
			<!-- 문의하기 페이지 -->
			<article id="Account">
				<h2 class="major">문의하기</h2>
				<form method="post" action="/join">
					<div class="field">
						<label>아이디</label>
						<input type="button" style="width:48%;" value ="${userID}" />
					</div>
					<div class="field half first">
						<label for="name">이름</label>
						<input type="text" name="userName" id="name" required />
					</div>
					<div class="field half">
						<label for="email">이메일주소</label>
						<input type="email" name="userEmail" id="email" style="background: transparent;" value ="" required />
					</div>
					<div class="field">
						<label for="email">문의 내용</label>
						<textarea name="content" rows="10" ></textarea>
					</div>
					<ul class="actions" style="text-align:right">
						<li><input type="submit" value="문의하기" class="special" /></li>
					</ul>
				</form>
			</article>
		</div>

		<!-- Footer -->
		<footer id="footer">
			<table border="1" style="text-align:center;" class="table_50">
				<tr>
				<c:choose>
					<c:when test="${empty userID}">
						<td><a href="#login">로그인</a></td>
						<td><a href="#JOIN">회원가입</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="/logout">로그아웃</a></td>
						<td><a href="#Account">문의하기</a></td>
					</c:otherwise>
				</c:choose>	
				</tr>
			</table>
		</footer>

	</div>
	<div id="bg"></div>


</body>
</html>

