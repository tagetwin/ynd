<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/nav.jsp"%>

<!-- slider_area_start -->
<div class="slider_area">
	<div class="single_slider d-flex align-items-center justify-content-center slider_bg_1 overlay2">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-xl-9">
					<div class="slider_text text-center">
						<p>The Best Game Comparison Reputation In The Area</p>
						<h3>Go Big with your next Game</h3>
						<div class="find_dowmain">
							<form action="/yp/game?cmd=search" class="find_dowmain_form" method="post">
								<input name="gameTitle" type="text" placeholder="Find your game" required="required" />
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- slider_area_end -->

<!-- latest_new_area_start -->
<div class="latest_new_area">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-100">
					<h3>Recent Post</h3>
					<p>
						There is Recent Post <br /> .Read
					</p>
				</div>
			</div>
		</div>
		<div class="row">
		
			<c:forEach var="board" items="${boards}" varStatus="status">
				<div class="col-xl-4 col-md-6 col-lg-4">
					<div class="single_news">
						<div class="thumb">
							<a href="/yp/board?cmd=detail&id=${board.id}"> <img src="/yp/upload/${board.fileName}" alt="" />
							</a>
						</div>
						<div class="news_content">
							<div class="news_meta">
								<a><fmt:formatDate value="${board.boardCreateTime}" type="both"/></a>
							</div>
							<h3>
								<a href="/yp/board?cmd=detail&id=${board.id}">${board.boardTitle}</a>
							</h3>							
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</div>
<!-- latest_new_area_end -->

<!-- prising_area_start -->

<!-- prising_area_end -->


<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
</body>
</html>
