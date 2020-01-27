<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>blog</h3>
</div>
<!-- bradcam_area_end -->

<!--================Blog Area =================-->
<section class="blog_area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-5 mb-lg-0">
				<div class="blog_left_sidebar">
				
					<c:forEach var="board" items="${boards}" varStatus="status">
						<article class="blog_item">
							<div class="blog_item_img">
								<a href="/yp/board?cmd=detail&id=${board.id}">
								<img class="card-img rounded-0" src="/yp/upload/${board.fileName}" alt="">
								</a>
								<a class="blog_item_date">
									<h3><fmt:formatDate value="${board.boardCreateTime}" pattern="dd"/></h3>
									<p><fmt:formatDate value="${board.boardCreateTime}" pattern="MM"/></p>
								</a>
							</div>

							<div class="blog_details">
								<a class="d-inline-block" href="/yp/board?cmd=detail&id=${board.id}"><h3>${board.boardTitle}</h3></a>
								<p class="excert">${board.content}</p>
								<ul class="blog-info-link">
									<li><a href="#"><i class="fa fa-user"></i>&nbsp ${board.category}</a></li>
									<li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
								</ul>
							</div>
						</article>
					</c:forEach>

					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link" aria-label="Previous"> <i class="ti-angle-left"></i>
							</a></li>
							<li class="page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item active"><a href="#" class="page-link">2</a></li>
							<li class="page-item"><a href="#" class="page-link" aria-label="Next"> <i class="ti-angle-right"></i>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
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
<!--================Blog Area =================-->


<%@ include file="/include/footer.jsp"%>