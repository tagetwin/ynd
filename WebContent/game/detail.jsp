<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../include/nav.jsp"%>
<style>
p {
	color: black;
}
</style>
<div class="bradcam_area breadcam_bg overlay2">
	<h3>Game Info</h3>
</div>
<!-- bradcam_area_end -->

<!-- Start Align Area -->
<div class="whole-wrap">
	<div class="container box_1170">
		<div class="section-top-border">
			<h3 class="mb-30">${games.gameTitle}</h3>
			<div class="row">
				<div class="col-md-8 col-sm-12">
					<img src="/yp/upload/${games.fileName}" width="640" alt="" class="img-fluid">
					<p id="gamedetail">
						<br>${games.gameContent}<br>
					</p>
					<hr>
				</div>
				<div class="col-md-4 mt-sm-20" id="gameinfo">
					<p>장르 : ${games.genre}</p>
					<br>
					<p>배급사 : ${games.publisher}</p>
					<br>
					<p>
						출시일 :
						<fmt:formatDate value="${games.publishDate}" pattern="yyyy년 MM월 dd일" />
					</p>
					<br>
					<p>
						추천수 : <span class="rec_count"></span>
					</p>
					<br>
					<p>최저가격 : ${games.steamPrice gt games.directPrice ? games.directPrice : games.steamPrice}</p>
					<br>

					<c:choose>
						<c:when test="${games.steamPrice ne 999999}">
						<div>
							<a href="${games.steamUrl}" target="_blank"><img src="img/game/steam.png" width="100" alt=""></a>
							</div>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${games.directPrice ne 999999}">
						<div>
							<a href="${games.directUrl}" target="_blank"><img src="img/game/dg.png" width="100" alt=""></a>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${not empty sessionScope.principal}">
							<div class="mt-5">
								<button id="likegame" onclick="likegame()" type="button" class="btn btn-info">
									<i class="fas fa-thumbs-up"></i>
								</button>
							</div>
						</c:when>
					</c:choose>
				</div>

			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
<script>
$(function(){
	
	
	
});
function likegame(){
	
	var data = {
// 			userId : ${sessionScope.principal.id},
			gid : ${games.gid}
			}
	
	$.ajax({
		type:"POST",
		url : "/yp/game?cmd=like",
		dataType : "text",
		contentType : "application/json",
		data : JSON.stringify(data),
		success : function(data){
			if(data==="ok"){
				alert("추천하였습니다.")
				recCount();
			}else{
				alert("이미 추천하셨습니다.")
			}
		},
		error : function(data) {
			alert("통신실패1")
		}	
	});
}	

function recCount() {
	 var data = {
			 gid : ${games.gid}
			 }
		$.ajax({
			type: "POST",
			url: "/yp/game?cmd=count",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify(data),
       	success: function (result) {
       		$(".rec_count").html(result);
       	},
       	error : function(result) {
      	 alert("통신실패2");
       	}
			
		});
	}

recCount();



</script>


</body>
</html>
