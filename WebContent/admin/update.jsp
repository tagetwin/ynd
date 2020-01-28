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
				<form class="form-contact contact_form" action="/yp/admin?cmd=updateProc" method="post" novalidate="novalidate" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
							<label>Game Title</label>
								<input value="${games.gameTitle}" class="form-control valid" name="gameTitle" id="gameTitle" type="text"/>
								<input value="${games.gid}" name="gid" type="hidden"/>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
							<label>Publisher</label>
								<input value="${games.publisher}" class="form-control valid" name="publisher" id="publisher" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>genre</label>
								<input value="${games.genre}" class="form-control valid" name="genre" id="genre" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>Publish Date</label>
								<input value="${games.publishDate}" class="form-control valid" name="publishDate" id="publishDate" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>steamPrice</label>
								<input value="${games.steamPrice}" class="form-control valid" name="steamPrice" id="steamPrice" type="text"/>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
							<label>directPrice</label>
								<input value="${games.directPrice}" class="form-control valid" name="directPrice" id="directPrice" type="text"/>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
							<label>fileName</label>
								<input value="/yp/upload/${games.fileName}" type="file" class="form-control w-100" name="filename1" />
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
							<label>Content</label>
								<textarea  class="form-control w-100" name="gameContent" cols="30" rows="15" placeholder="Enter Content">${games.gameContent}</textarea>
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
<%@ include file="/include/js.jsp"%>
</body>
</html>