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
		<a href="/yp/admin?cmd=game" class="genric-btn danger-border large my-3">Game</a>
		<a href="/yp/admin?cmd=maillist" class="genric-btn warning large mt-3">Email</a>

		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Email Address</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="mailAddress" items="${mailAddress}" varStatus="status">
				<tr>
					<td>${mailAddress.mid}</td>
					<td>${mailAddress.reg_mail}</td>
					<td><a href="/yp/admin?cmd=maildelete&mid=${mailAddress.mid}" class="genric-btn primary-border small px-3">삭제</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<a href="#test-form3" class="btn">메일 보내기</a>
	</div>
</div>

<div id="test-form3" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<div class="logo text-center">
					<a href="/yp/"><img src="img/form-logo.png" alt="" /> </a>
				</div>
				<h3 class="text-center">Profile</h3>
				<form action="/yp/user?cmd=profileProc" method="POST">
					<div class="row">
						
						<div class="col-xl-12">
							<button type="submit" class="boxed_btn_green mb-3">회원정보수정</button>
						</div>
					</div>
				</form>
				<div class="col-xl-12">
					<form action="/yp/user?cmd=delete" method="post">
						<input type="hidden" name="id" value="${sessionScope.principal.id}" />
						<button type="submit" class="boxed_btn_red">탈퇴</button>
					</form>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>

</body>
</html>