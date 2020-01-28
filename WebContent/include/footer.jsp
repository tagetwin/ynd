<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- footer -->
<footer class="footer">
	<div class="footer_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-4 col-md-6 col-lg-4">
					<div class="footer_widget">
						<div class="footer_logo">
							<a href="#"> <img src="img/logo.png" alt="" />
							</a>
						</div>
						<p class="footer_text doanar">
							<a class="first">+10 0008 0000 </a> <br /> <a>yndg@support.com</a>
						</p>
						<div class="socail_links">
							<ul>
								<li><a href="https://www.facebook.com/" target="_blank"> <i class="fab fa-facebook"></i>
								</a></li>
								<li><a href="https://twitter.com/?lang=ko" target="_blank"> <i class="fab fa-twitter-square"></i>
								</a></li>
								<li><a href="https://www.instagram.com/?hl=ko" target="_blank"> <i class="fab fa-instagram"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-md-6 col-lg-3">
					<div class="footer_widget">
						<h3 class="footer_title">Navigation</h3>
						<ul>
							<c:choose>
								<c:when test="${empty sessionScope.principal}">
									<li><a href="#test-form2" class="login popup-with-form">Join</a></li>
									<li><a href="#test-form" class="login popup-with-form">Login</a></li>
								</c:when>
							</c:choose>
							<li><a href="/yp/board?cmd=list">Blog</a></li>
							<li><a href="/yp/gallery?cmd=list">Gallery</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-5 col-md-6 col-lg-5">
					<div class="footer_widget">
						<h3 class="footer_title">Newsletter</h3>
						<form action="/yp/" class="newsletter_form" method="post">
							<input name="email" id="email" type="email" placeholder="Enter your mail" required/>
							<button onclick="regmail()" type="button">Sign Up</button>
						</form>
						<p class="newsletter_text">Subscribe newsletter to get updates</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copy-right_text">
		<div class="container">
			<div class="footer_border"></div>
			<div class="row">
				<div class="col-xl-12">
					<p class="copy_right text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i class="far fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- footer -->


<!-- JS here -->


