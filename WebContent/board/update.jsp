<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>Post</h3>
</div>
<!-- bradcam_area_end -->

<!-- post -->
<section class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="contact-title">Post Update</h2>
			</div>
			<div class="col-lg-12">
				<form class="form-contact contact_form" action="/yp/board?cmd=updateProc" method="post" novalidate="novalidate" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${buVM.board.id}" />
					<input type="hidden" name="userId" value="${buVM.board.userId}" />
					<div class="row">
						<div class="col-sm-2">
							<div class="form-group">
								<input value="${sessionScope.principal.username}" class="single-input" name="username" id="username" type="text" readonly="readonly" />
							</div>
						</div>
						<div class="single-element-widget col-sm-4">
							<div class="default-select" id="default-select">
								<select name="category">
									<option value="review">Review</option>
									<option value="recommendation">Recommendation</option>
									<option value="information">Information</option>
									<option value="tip">Tip</option>
								</select>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input type="file" name="filename1" id="filename1" class="form-control" required/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input value="${buVM.board.boardTitle}" class="form-control" name="boardTitle" id="boardTitle" type="text" placeholder="Enter Title" required/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<textarea class="form-control w-100" name="content" cols="30" rows="12" placeholder="Enter Content" required>${buVM.board.content}</textarea>
							</div>
						</div>
					</div>
					<div class="form-group mt-3 float-right">
						<button type="submit" class="button button-contactForm boxed-btn">Update</button>
						<a href="/yp/board?cmd=list" class="button button-contactForm boxed-btn">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
</body>
</html>
