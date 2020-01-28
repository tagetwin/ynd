<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>page management</h3>
</div>
<!-- bradcam_area_end -->

<div class="whole-wrap">
	<div class="container box_1170">
	<a href="/yp/admin?cmd=user" class="genric-btn success-border large mt-3">User</a>
	<a href="/yp/admin?cmd=blog" class="genric-btn primary-border large mt-3">Blog</a>
	<a href="/yp/admin?cmd=gallery" class="genric-btn info large mt-3">Gallery</a>
	<a href="/yp/admin?cmd=game" class="genric-btn danger-border large mt-3">Game</a>
	<a href="/yp/admin?cmd=maillist" class="genric-btn warning-border large mt-3">Email</a>
		<div class="section-top-border">
			<h3 class="mb-30">갤러리 페이지</h3>
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="visit">Username</div>
						<div class="percentage">Filename</div>
						<div class="percentage">CreateTime</div>
					</div>
					<c:forEach var="gallery" items="${gallerys}" varStatus="status">
					<div class="table-row">
						<div class="serial">${gallery.pid}</div>
						<div class="visit">${gallery.userId}</div>
						<div class="percentage">${gallery.fileName}</div>
						<div class="percentage">${gallery.PCreateTime}</div>
							<form action="/yp/gallery?cmd=delete" method="post">
								<input type="hidden" name="pid" value="${gallery.pid}" />
								<input type="hidden" name="userId" value="${gallery.userId}" />
								<button type="submit" class="genric-btn danger-border circle arrow">삭제</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
</body>
</html>
