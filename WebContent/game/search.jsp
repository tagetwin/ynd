<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/nav.jsp"%>


<div class="bradcam_area2 breadcam_bg_2 ">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-xl-9">
            <div class="breadcam_text text-center">
              <h3>Search Game</h3>
              <div class="find_dowmain">
                <form action="/yp/game?cmd=search" class="find_dowmain_form" method="POST">
                  <input name="gameTitle" type="text" placeholder="Find Game Title" required/>
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

		<div class="row">
			<c:forEach var="game" items="${games}" varStatus="status">
				<div class="col-xl-12 mb-2">
					<div class="single_search d-flex justify-content-between align-items-center">
						<div class="name_title">
							<h4>
								<a href="/yp/game?cmd=detail&gid=${game.gid}">${game.gameTitle}</a>
							</h4>
						</div>
						<div class="prising_content">
							<i class="far fa-thumbs-up"></i> <a>${game.recommendation}</a> <a href="https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/" target="_blank"> <img src="img/game/steam.png"
								width="100" alt=""></a> <a><fmt:formatNumber value="${game.steamPrice}" /></a> <a href="https://directg.net/game/game_page.html?product_code=50002056" target="_blank"> <img
								src="img/game/dg.png" width="100" alt=""></a> <a><fmt:formatNumber value="${game.directPrice}" /></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
    </div>
    <!-- search_area_end -->

    <!-- have_question_start -->
    <div class="search_area"></div>
 

<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/js.jsp"%>
</body>
</html>
