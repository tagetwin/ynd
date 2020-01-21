<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Hostza</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
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
                  <a href="/yp/">
                    <img src="img/logo.png" alt="" />
                  </a>
                </div>
              </div>
              <div class="col-xl-7 col-lg-7">
                <div class="main-menu  d-none d-lg-block">
                  <nav>
                    <ul id="navigation">
                      <li><a class="active" href="index.html">home</a></li>

                      <li>
                        <a href="/yp/board?cmd=list">blog</a>
                      </li>
                      <li>
                        <a href="/yp/gallery.jsp">Gallery</a>
                      </li>
                      <li><a href="/yp/post.jsp">Post</a></li>
                      <li>
                        <a href="#test-form2" class="login popup-with-form"
                          >Join</a
                        >
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
              <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                <div class="log_chat_area d-flex align-items-center">
                  <a id="loginbtn"
                    href="#test-form"
                    class="login popup-with-form genric-btn info circle arrow"
                  >
                    <i class="flaticon-user"></i>
                    <span>로그인</span>
                  </a>
                </div>
              </div>
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
            <a href="#">
              <img src="img/form-logo.png" alt="" />
            </a>
          </div>
          <h3>Sign in</h3>
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
            Don’t have an account?
            <a class="dont-hav-acc" href="#test-form2">Sign Up</a>
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
            <a href="#">
              <img src="img/form-logo.png" alt="" />
            </a>
          </div>
          <h3>Resistration</h3>
          <form action="/yp/user?cmd=joinProc" method="POST">
            <div class="row">
              <div class="col-xl-12 col-md-12">
                <input name="username" type="text" placeholder="Enter username" />
              </div>
              <div class="col-xl-12 col-md-12">
                <input id="pw1" name="password" type="password" placeholder="Password" />
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
    <!-- form itself end -->