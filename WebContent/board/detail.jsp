<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/include/nav.jsp"%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>Single Blog</h3>
</div>
<!-- bradcam_area_end -->

<!--================Blog Area =================-->
<section class="blog_area single-post-area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<div class="single-post">
					<div class="feature-img">
						<img class="img-fluid" src="/yp/upload/${buVM.board.fileName}" alt="">
					</div>
					<div class="blog_details">
						<h2>${buVM.board.boardTitle}</h2>
						<ul class="blog-info-link mt-3 mb-4">
							<li><a href="#"><i class="fa fa-user"></i>${buVM.board.category}</a></li>
							<li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
							<c:choose>
								<c:when test="${sessionScope.principal.id eq buVM.board.userId}">
									<li><a href="/yp/board?cmd=update&userId=${buVM.board.userId}&id=${buVM.board.id}"><i class="fas fa-edit"></i> Update </a></li>
									<li><a href="/yp/board?cmd=delete&userId=${buVM.board.userId}&id=${buVM.board.id}"><i class="fas fa-trash-alt"></i> Delete </a></li>
								</c:when>
							</c:choose>
						</ul>
						<p class="excert">${buVM.board.content}</p>
					</div>
				</div>
				<div class="navigation-top">
					<div class="d-sm-flex justify-content-between text-center">
						<p class="like-info">
							<span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4 people like this
						</p>
						<div class="col-sm-4 text-center my-2 my-sm-0">
							<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
						</div>
						<ul class="social-icons">
							<li><a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="https://twitter.com/?lang=ko" target="_blank"><i class="fab fa-twitter"></i></a></li>
						</ul>
					</div>
					<div class="navigation-area">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"> <img class="img-fluid" src="img/post/preview.png" alt="">
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white ti-arrow-left"></span>
									</a>
								</div>
								<div class="detials">
									<p>Prev Post</p>
									<a href="#">
										<h4>Space The Final Frontier</h4>
									</a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>Next Post</p>
									<a href="#">
										<h4>Telescopes 101</h4>
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white ti-arrow-right"></span>
									</a>
								</div>
								<div class="thumb">
									<a href="#"> <img class="img-fluid" src="img/post/next.png" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="blog-author">
					<div class="media align-items-center">
						<img src="img/blog/author.png" alt="">
						<div class="media-body">
							<a href="#">
								<h4>${buVM.user.username}</h4>
							</a>
							<p>Second divided from form fish beast made. Every of seas all gathered use saying you're, he our dominion twon Second divided from</p>
						</div>
					</div>
				</div>

				<%@ include file="/include/comment.jsp"%>


				
			</div>
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<aside class="single_sidebar_widget search_widget">
						<a href="/yp/board?cmd=list" class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">List</a>
					</aside>
					<aside class="single_sidebar_widget search_widget">
						<form action="/yp/board?cmd=search" method="post">
							<div class="form-group">
								<div class="input-group mb-3">
									<input name="boardTitle" type="text" class="form-control" placeholder='Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'" required="required" />
									<div class="input-group-append">
										<button class="btn" type="button">
											<i class="ti-search"></i>
										</button>
									</div>
								</div>
							</div>
							<button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">Search</button>
						</form>
					</aside>

					<aside class="single_sidebar_widget post_category_widget">
						<h4 class="widget_title">Category</h4>
						<ul class="list cat-list">
							<li><a href="/yp/board?cmd=review" class="d-flex">
									<p>Review</p>
							</a></li>
							<li><a href="/yp/board?cmd=recommendation" class="d-flex">
									<p>Recommendation</p>
							</a></li>
							<li><a href="/yp/board?cmd=information" class="d-flex">
									<p>Information</p>
							</a></li>
							<li><a href="/yp/board?cmd=tip" class="d-flex">
									<p>Tip</p>
							</a></li>
						</ul>
					</aside>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="/include/footer.jsp"%>