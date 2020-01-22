<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>


<div class="bradcam_area2 breadcam_bg_2 ">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-xl-9">
				<div class="breadcam_text text-center">
					<h3>Search your Domain</h3>
					<div class="find_dowmain">
						<form action="#" class="find_dowmain_form">
							<input type="text" placeholder="Find your domain" />
							<button type="submit">search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end -->

<!-- search_area_start -->
<div class="search_area">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="search_title">
					<h3>Search Result</h3>
				</div>
			</div>
		</div>
		<div class="row mb-20">
			<div class="col-xl-6">
				<div class="search_result_name">
					<h4>Domain name</h4>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="search_result_prise text-right">
					<h4>Pricing</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12">
				<div class="single_search d-flex justify-content-between align-items-center">
					<div class="name_title">
						<h4>fanus.com</h4>
					</div>
					<div class="prising_content">
						<a class="premium" href="#">Premium</a> <a href="#">$5678/year</a> <a class="boxed_btn_green" href="#">Get Now</a>
					</div>
				</div>
				<div class="single_search d-flex justify-content-between align-items-center">
					<div class="name_title">
						<h4>fanus.net</h4>
					</div>
					<div class="prising_content">
						<a href="#">$5/year</a> <a class="boxed_btn_green" href="#">Get Now</a>
					</div>
				</div>
				<div class="single_search d-flex justify-content-between align-items-center">
					<div class="name_title">
						<h4>fanus.com</h4>
					</div>
					<div class="prising_content">
						<a class="premium disable" href="#">Not available</a> <a href="#">$5678/year</a> <a class="boxed_btn_green disable" href="#">Get Now</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<%@ include file="/include/footer.jsp"%>
