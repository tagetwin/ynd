<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../include/nav.jsp"%>
<style>
p {
	color: black;
}
</style>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>Game Info</h3>
</div>
<!-- bradcam_area_end -->

<!-- Start Align Area -->
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<h3 class="mb-30">${games.gameTitle}</h3>
			<div class="row">
				<div class="col-md-8 col-sm-12">
					<img src="/yp/upload/${games.fileName}" width="640" alt="" class="img-fluid">
					<p id="gamedetail">
						<br>${games.gameContent}<br>
					</p>
					<hr>
				</div>
				<div class="col-md-4 mt-sm-20" id="gameinfo">
					<p>장르 : ${games.genre}</p>
					<br>
					<p>배급사 : ${games.publisher}</p>
					<br>
					<p>출시일 : <fmt:formatDate value="${games.publishDate}" pattern="yyyy년 MM월 dd일"/> </p>
					<br>
					<p>추천수 : ${games.recommendation}</p>
					<br>
					<p>최저가격 : ${games.steamPrice gt games.directPrice ? games.directPrice : games.steamPrice}</p>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>