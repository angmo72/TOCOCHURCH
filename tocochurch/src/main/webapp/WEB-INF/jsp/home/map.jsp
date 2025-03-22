<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/m_header.jsp" %>

<script type="text/javascript">
    var datafields = "";
    var menuCrtDatadaptor = "";
    $(document).ready(function () {
    	
    });
    
</script>

        
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">찾아오시는길</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">교회소개 > 찾아오시는길</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-12">
                                <div id="viewMap" class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
										함께가는교회 : 충청남도 천안시 서북구 쌍용 8길 22
                                    </div>
                                    <div class="card-body">
										<div id="daumRoughmapContainer1742391886645" class="root_daum_roughmap root_daum_roughmap_landing"></div>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	var divWidth = Math.round($('#viewMap').width()-40);
	var heigth = Math.round(divWidth*360/640);

	new daum.roughmap.Lander({
		"timestamp" : "1742391886645",
		"key" : "2neev",
// 		"mapWidth" : "640",
// 		"mapHeight" : "360"
		"mapWidth" : divWidth,
		"mapHeight" : heigth
	}).render();
</script>
                
<%@include file="../include/m_footer.jsp" %>

