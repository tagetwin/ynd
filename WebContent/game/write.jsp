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
				<h2 class="contact-title">Post</h2>
			</div>
			<div class="col-lg-12">
				<form class="form-contact contact_form" action="/yp/board?cmd=writeProc" method="post" novalidate="novalidate">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<input value="${sessionScope.principal.username}" class="form-control valid" name="username" id="username" type="text" readonly="readonly"/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<input class="form-control" name="boardTitle" id="boardTitle" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Title"/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<textarea class="form-control w-100" name="content" id=summernote cols="30" rows="12" placeholder="Enter Content"></textarea>
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<button type="submit" class="button button-contactForm boxed-btn">Send</button>
						<a href="/yp/board?cmd=list" class="button button-contactForm boxed-btn">Close</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="/include/footer.jsp"%>