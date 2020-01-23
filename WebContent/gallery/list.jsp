<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>Gallery</h3>
</div>
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<h3>Image Gallery</h3>
			<c:choose>
				<c:when test="${not empty sessionScope.principal}">
<!-- 					<a href="/yp/gallery?cmd=upload" class="btn ">Upload</a> -->
					<a href="#upload-form" class="login popup-with-form genric-btn info circle arrow">Upload</a>
				</c:when>
			</c:choose>
			
			<div class="row gallery-item">
			<c:forEach var="gallery" items="${gallerys}" varStatus="status">
			
				<div class="col-md-4">
					<a href="/yp/upload/${gallery.fileName}" class="img-pop-up">
						<div class="single-gallery-image" style="background: url(/yp/upload//${gallery.fileName});"></div>
					</a>
				</div>
			
			</c:forEach>
			</div>
		</div>
	</div>
</div>

<div id="upload-form" class="white-popup-block mfp-hide">
	<div class="popup_box ">
		<div class="popup_inner">
			<div class="logo text-center">
				<a href="#"> <img src="img/form-logo.png" alt="" />
				</a>
			</div>
			<h3 class="text-center">IMAGE UPLOAD</h3>
			<form action="/yp/gallery?cmd=uploadProc" method="POST" enctype="multipart/form-data">
				<div class="row">
					<div class="col-xl-12 col-md-12">
					<label for="username">Username</label>
						<input type="text" name="username" id="username" value="${sessionScope.principal.username}" readonly="readonly"/>
						<input type="hidden" name="userId" value="${sessionScope.principal.id}"/>
					</div>
					
					<div class="col-xl-12 col-md-12">
					<label for="subject">Subject</label>
						<input type="text" name="psubject" id="subject" />
					</div>

					<div class="col-xl-12 col-md-12">
						<label for="filename1">파일명 : </label>
						<input type="file" name="filename1" id="filename1" />
					</div>

					<div class="col-xl-12">
						<button type="submit" class="boxed_btn_green">Sign in</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>


<!--추후에 이미지가 없으면 이미지가 없습니다라고 띄워주기choose when -->
<%@ include file="/include/footer.jsp"%>