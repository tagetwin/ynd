<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>Post</h3>
</div>
<!-- bradcam_area_end -->

<!-- post -->
<div class="container">
	<div class="row">
		<div class="col-md-12 col-md-offset-2">
			<div class="card my-5">
				<h5 class="card-header">Post</h5>
				<div class="card-body">
					<form action="/yp/board?cmd=updateProc" method="post">
						<input type="hidden" name="id" value="${buVM.board.id}" />
						<input type="hidden" name="userId" value="${buVM.board.userId}" />
						<div class="form-group">
							<label for="title">Title</label>
							<input type="text" class="form-control" required="required" name="boardTitle" value="${buVM.board.boardTitle}"/>
						</div>
						<div class="form-group">
							<label for="content">Content </label>
							<textarea rows="7" class="form-control" required="required" name="content" >${buVM.board.content}</textarea>
						</div>
						<div class="form-group float-right">
							<button type="submit" class="btn btn-primary">Update</button>
							<a href="/yp/board?cmd=list" class="btn btn-default">Cancel</a>
<!-- 							<button class="btn btn-default">Cancel</button> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp"%>