<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>page management</h3>
</div>
<!-- bradcam_area_end -->

<div class="whole-wrap">
	<div class="container box_1170">
	<a class="genric-btn success-border large mt-3">User</a>
	<a class="genric-btn primary-border large mt-3">Blog</a>
	<a class="genric-btn info-border large mt-3">Gallery</a>
	<a class="genric-btn danger-border large mt-3">Game</a>
		<div class="section-top-border">
			<h3 class="mb-30">회원정보 페이지</h3>
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="country">Username</div>
						<div class="visit">Email</div>
						<div class="percentage">Address</div>
					</div>
					<c:forEach var="user" items="${users}" varStatus="status">
						<div class="table-row">
							<div class="serial">${user.id}</div>
							<div class="country">${user.username}</div>
							<div class="visit">${user.email}</div>
							<div class="visit">${user.address}</div>
							<form action="/yp/user?cmd=delete" method="post">
								<input type="hidden" name="id" value="${user.id}" />
								
							<button type="submit" class="genric-btn danger-border circle arrow">삭제</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

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
							<div class="visit">${board.boardTitle}</div>
							<div class="percentage">${board.content}</div>
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

		<div class="section-top-border">
			<h3 class="mb-30">갤러리 페이지</h3>
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="country">Title</div>
						<div class="visit">Username</div>
						<div class="percentage">Filename</div>
						<div class="percentage">CreateTime</div>
					</div>
					<c:forEach var="gallery" items="${gallerys}" varStatus="status">
					<div class="table-row">
						<div class="serial">${gallery.pid}</div>
						<div class="country">${gallery.psubject}</div>
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
