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
	<a href="/yp/admin?cmd=blog" class="genric-btn primary large mt-3">Blog</a>
	<a href="/yp/admin?cmd=gallery" class="genric-btn info-border large mt-3">Gallery</a>
	<a href="/yp/admin?cmd=game" class="genric-btn danger-border large mt-3">Game</a>
	<a href="/yp/admin?cmd=maillist" class="genric-btn warning-border large mt-3">Email</a>
		<div class="section-top-border">
			<h3 class="mb-30">글 페이지</h3>
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="serial">Time</div>
						<div class="country">userId</div>
						<div class="visit">title</div>
						<div class="percentage">content</div>
					</div>
					<c:forEach var="board" items="${boards}" varStatus="status">
						<div class="table-row">
							<div class="serial">${board.id}</div>
							<div class="serial">${board.boardCreateTime}</div>
							<div class="serial">${board.userId}</div>
							<div class="visit truncate">${board.boardTitle}</div>
							<div class="percentage truncate">${board.content}</div>
							<form action="/yp/board?cmd=delete" method="post">
								<input type="hidden" name="id" value="${board.id}" />
								<input type="hidden" name="userId" value="${board.userId}" />
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