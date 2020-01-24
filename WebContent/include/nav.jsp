<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Hostza</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/magnific-popup.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="css/nice-select.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/gijgo.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/slicknav.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/imgutil.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css">

</head>

<body>
	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no-gutters">
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="/yp/"> <img src="img/logo.png" alt="" />
								</a>
							</div>
						</div>
						<div class="col-xl-7 col-lg-7">
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="/yp/">home</a></li>
										<li><a href="/yp/board?cmd=list">blog</a></li>
										<li><a href="/yp/gallery?cmd=list">Gallery</a></li>
										<c:choose>
											<c:when test="${not empty sessionScope.principal}">
												<li><a href="/yp/board?cmd=write">Post</a></li>
												<li><a href="#test-form3" class="login popup-with-form">profile</a></li>
												<li><a href="/yp/user?cmd=logout">Logout</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="#test-form" class="login popup-with-form">Login</a></li>
												<li><a href="#test-form2" class="login popup-with-form">Join</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 d-none d-lg-block">
							<div class="log_chat_area d-flex align-items-center">
								<c:choose>
									<c:when test="${not empty sessionScope.principal}">
										<a id="loginbtn" href="/yp/user?cmd=logout" class="genric-btn danger circle arrow"> <i class="flaticon-user"></i> <span>로그아웃</span>
										</a>
									</c:when>
									<c:otherwise>
										<a id="loginbtn" href="#test-form" class="login popup-with-form genric-btn info circle arrow"> <i class="flaticon-user"></i> <span>로그인</span>
										</a>
									</c:otherwise>

								</c:choose>
								<c:choose>
									<c:when test="${sessionScope.principal.username eq 'admin'}">
										<a href="/yp/user?cmd=admin" class="genric-btn warning circle arrow" type="button"> <i class="flaticon-user"></i> <span>관리자</span>
										</a>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
						<!-- 						<form id="adminForm" action="/yp/user?cmd=admin" method="POST"> -->
						<%-- 							<input type="hidden" name="id" value="${buVM.board.id}" /> <input type="hidden" name="userId" value="${buVM.board.userId}" /> --%>
						<!-- 						</form> -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->

	<!-- link that opens popup -->

	<!-- form itself end-->
	<div id="test-form" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<div class="logo text-center">
					<a href="#"> <img src="img/form-logo.png" alt="" />
					</a>
				</div>
				<h3 class="text-center">Sign in</h3>
				<form action="/yp/user?cmd=loginProc" method="POST">
					<div class="row">
						<div class="col-xl-12 col-md-12">
							<input name="username" type="text" placeholder="Enter username" />
						</div>
						<div class="col-xl-12 col-md-12">
							<input name="password" type="password" placeholder="Password" />
						</div>
						<div class="col-xl-12">
							<button type="submit" class="boxed_btn_green">Sign in</button>
						</div>
					</div>
				</form>
				<p class="doen_have_acc">
					Don’t have an account? <a class="dont-hav-acc" href="#test-form2">Sign Up</a>
				</p>
			</div>
		</div>
	</div>
	<!-- form itself end -->

	<!-- form itself end-->
	<div id="test-form2" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<div class="logo text-center">
					<a href="#"> <img src="img/form-logo.png" alt="" />
					</a>
				</div>
				<h3 class="text-center">Resistration</h3>
				<form action="/yp/user?cmd=joinProc" method="POST">
					<div class="row">
						<div class="col-xl-12 col-md-12">
							<input name="username" type="text" placeholder="Enter username" />
						</div>
						<div class="col-xl-12 col-md-12">
							<input id="pw1" name="password" type="password" placeholder="Enter Password" />
						</div>
						<div class="col-xl-12 col-md-12">
							<input id="pw2" type="Password" placeholder="Confirm password" />
						</div>
						<div class="col-xl-12">
							<button type="submit" class="boxed_btn_green">Sign Up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="test-form3" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<div class="logo text-center">
					<a href="#"><img src="img/form-logo.png" alt="" /> </a>
				</div>
				<h3 class="text-center">Profile</h3>
				<form action="/yp/user?cmd=profileProc" method="POST">
					<div class="row">
						<div class="col-xl-12 col-md-12">
							<label for="username">username</label> <input name="username" type="text" readonly="readonly" value="${sessionScope.principal.username}" />
						</div>
						<div class="col-xl-12 col-md-12">
							<label for="password">password</label> <input id="pw3" name="password" type="password" placeholder="Enter Password" required="required" />
						</div>
						<div class="col-xl-12 col-md-12">
							<label for="email">email</label> <input name="email" type="email" value="${sessionScope.principal.email}" />
						</div>
						<div class="col-xl-12 col-md-12">
							<label for="address">address</label> <input id="address" name="address" type="text" value="${sessionScope.principal.address}" />
						</div>
						<div class="col-xl-12">
							<button type="submit" class="boxed_btn_green mb-3">회원정보수정</button>
						</div>
					</div>
				</form>
				<div class="col-xl-12">
					<form action="/yp/user?cmd=delete" method="post">
					<input type="hidden" name="id" value="${sessionScope.principal.id}"/>
						<button type="submit" class="boxed_btn_red">탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- form itself end -->