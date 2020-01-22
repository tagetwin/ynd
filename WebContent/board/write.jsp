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
					<form action="/index.jsp" method="post">
						<div class="form-group">
							<label for="images">images<span>*</span> <small>(Upload images.)</small></label> <input type="text" class="form-control" required="required" name="images" />
						</div>

						<div class="form-group">
							<label for="title">Title <span>*</span></label> <input type="text" class="form-control" required="required" name="title" />
						</div>

						<div class="form-group">
							<label for="description">Description</label>
							<textarea rows="5" class="form-control" name="description" required="required"></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">Create</button>
							<button class="btn btn-default">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/include/footer.jsp"%>