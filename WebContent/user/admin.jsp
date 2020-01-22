<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
	<h3>page management</h3>
</div>
<!-- bradcam_area_end -->

<div class="whole-wrap">
	<div class="container box_1170">

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

<!-- 		<form id="deleteForm" action="/yp/board?cmd=delete" method="POST"> -->
<%-- 			<input type="hidden" name="id" value="${board.id}" /> --%>
<%-- 			<input type="hidden" name="userId" value="${board.userId}" /> --%>

<!-- 		</form> -->

		<div class="section-top-border">
			<h3 class="mb-30">갤러리 페이지</h3>
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">#</div>
						<div class="country">Username</div>
						<div class="visit">Email</div>
						<div class="percentage">Address</div>
					</div>
					<div class="table-row">
						<div class="serial">01</div>
						<div class="country">
							<img src="img/elements/f1.jpg" alt="flag">Canada
						</div>
						<div class="visit">645032</div>
						<div class="percentage">
							<div class="progress">
								<div class="progress-bar color-1" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp"%>
