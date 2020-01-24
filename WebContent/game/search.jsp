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
                  <input name="gameTitle" type="text" placeholder="Find Game Title" />
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
          <div class="col-xl-12">
            <div
              class="single_search d-flex justify-content-between align-items-center"
            >
              <div class="name_title">
                <h4><a href="/yp/game/detail.jsp">Red Dead Redemption 2</a></h4>
              </div>
              <div class="prising_content">
                <i class="far fa-thumbs-up"></i><a>1000</a>
                <a href="https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/" target="_blank"><img src="/img/steam.png" width="100" alt=""></a>
                <a>52,800</a>
                <a href="https://directg.net/game/game_page.html?product_code=50002056" target="_blank"><img src="/img/dg.png" width="100" alt=""></a>
                <a>49,800</a>
              </div>
            </div>
          </div>

          <div class="col-xl-12">
            <div
              class="single_search d-flex justify-content-between align-items-center"
            >
              <div class="name_title">
                <h4><a href="/yp/game/detail.jsp">DRAGON BALL Z: KAKAROT</a></h4>
              </div>
              <div class="prising_content">
                <i class="far fa-thumbs-up"></i><a>500</a>
                <a href="#"><img src="/img/steam.png" width="100" alt=""></a>
                <a>64,800</a>
                <a href="#"><img src="/img/dg.png" width="100" alt=""></a>
                <a>61,000</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- search_area_end -->

    <!-- have_question_start -->
    <div class="search_area"></div>


<%@ include file="/include/footer.jsp"%>
