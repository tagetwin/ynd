<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>

<div class="bradcam_area breadcam_bg overlay2">
	<h3>Game Post</h3>
</div>
<!-- bradcam_area_end -->

<!-- post -->
<section class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="contact-title">Game Post</h2>
			</div>
			<div class="col-lg-12">
				<form class="form-contact contact_form" action="/yp/board?cmd=writeProc" method="post" novalidate="novalidate">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
							<label>Game Title</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
							<label>Publisher</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>genre</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>Publish Date</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>steamPrice</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>directPrice</label>
								<input class="form-control valid" name="username" id="username" type="text"/>
							</div>
						</div>
						
						<div class="col-12">
							<div class="form-group">
							<label>Content</label>
								<textarea class="form-control w-100" name="content" id=summernote cols="30" rows="15" placeholder="Enter Content"></textarea>
							</div>
						</div>
					</div>
					<div class="form-group mt-3">
						<button type="submit" class="button button-contactForm boxed-btn">Send</button>
						<a href="/yp/admin?cmd=game" class="button button-contactForm boxed-btn">Close</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="/include/footer.jsp"%>