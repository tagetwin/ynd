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
		<a href="/yp/admin?cmd=gallery" class="genric-btn info-border large mt-3">Gallery</a>
		<a href="/yp/admin?cmd=game" class="genric-btn danger large my-3">Game</a>
		<a href="/yp/admin?cmd=maillist" class="genric-btn warning-border large mt-3">Email</a>

		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Title</th>
					<th>Content</th>
					<th>Genre</th>
					<th>Publisher</th>
					<th>Date</th>
					<th>SPrice</th>
					<th>DPrice</th>
					<th>Like</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="game" items="${games}" varStatus="status">
				<tr>
					<td><a href="/yp/game?cmd=detail&gid=${game.gid}">${game.gid}</a></td>
					<td>${game.gameTitle}</td>
					<td>${game.gameContent}</td>
					<td>${game.genre}</td>
					<td>${game.publisher}</td>
					<td>${game.publishDate}</td>
					<td>${game.steamPrice}</td>
					<td>${game.directPrice}</td>
					<td>${game.recommendation}</td>
					<td><a href="/yp/admin?cmd=update&gid=${game.gid}" class="genric-btn primary-border small px-3">수정</a></td>
					<td><a href="/yp/admin?cmd=delete&gid=${game.gid}" class="genric-btn primary-border small px-3">삭제</a></td>
				</tr>
			</c:forEach>

			</tbody>
		</table>
		<div class="mb-3">
			<a href="/yp/admin?cmd=write" class="genric-btn warning large ">ADD</a>
		</div>
	</div>
</div>




<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
</body>
</html>
