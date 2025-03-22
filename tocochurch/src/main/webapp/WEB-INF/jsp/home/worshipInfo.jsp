<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/m_header.jsp" %>
<%
String liveInfo = (String) request.getAttribute("YOUTUBE_LIVE");
%>
<script type="text/javascript">
    var datafields = "";
    var menuCrtDatadaptor = "";
    $(document).ready(function () {
<%-- 		alert("<%=liveInfo%>"); --%>

    	//라이브방송 화면 조절
    	var lWidth = $("#liveBroad").width();
    	var lHeight = Math.round((9*lWidth)/16);
    	$("#liveBroad").height(lHeight);
    	  	
    	
    	//주일예배
    	fnWorshipSearch("weekWorshipTable","PLKjnkDLEDs8lJvNGJuAHMoKu_vG6nZNLc");
    	
    	//주일저녁예배
    	fnWorshipSearch("nightWorshipTable","PLKjnkDLEDs8l0L_psNrf57swDvIuQBn1Y");
    	
    	// 수요예배
    	fnWorshipSearch("wendWorshipTable","PLKjnkDLEDs8luKnYrN3EQCyQgBP1H0Fhm");
    	
    	// 금요기도회
    	fnWorshipSearch("fridWorshipTable","PLKjnkDLEDs8nZ4BanFcUgDQHpNaFPQ4zK");
    	
    	//새벽기도회
    	fnWorshipSearch("morningWorshipTable","PLKjnkDLEDs8mbP8iqeNPeYFq_q4b11JIW");
    	
    	
    });
    
    function fnWorshipSearch(traget, playId){
   	
	  	$.ajax({
	  	    url: '/youtube/playList.do',
	  	    method: 'get',
	  	    data: {playList:playId},		  	    
	  	    dataType : 'json',
	  	    success: function (data, status, xhr) {
	  	    	
	  	    	//링크 데이터 형성
	  	    	fnSetList(traget, data.data);
	        	
	  	    },
	  	    error: function (data, status, err) {
	  	    	alert("유튜브 재상목록 조회 오류");
	  	    },
	  	    complete: function () {
	  	    }
	  	});
    }
    
    function fnSetList(obj, data){
    	
        
//         pMap.put("title", videoTitle);
//         pMap.put("desc", videoDesc);
//         pMap.put("img", videoImg);
//         pMap.put("id", videoId);
    	
    	var innHtml ="";
    	
    	
    	for(var i=0 ; i < data.length ; i++){
	    	var title = data[i].title;
	    	var desc = data[i].desc;
	    	
	    	if(title.length >= 16){ title = title.substring(0,14)+"...";}
	    	if(desc.length >= 34){ desc = desc.substring(0,34)+"...";}
	    	
    		innHtml = innHtml + "<tr style='cursor:pointer' onclick='fnViewVideo(\""+data[i].id+"\")'>\n";
    		innHtml = innHtml + "<td rowspan='2' class='p-xxl-1'><img id='"+obj +"_"+i+"' sre='"+data[i].img+"' width='120' height='90'></td>\n";
    		innHtml = innHtml + "<td><b>"+title+"</b></td>\n";
    		innHtml = innHtml + "</tr><tr>\n";
    		innHtml = innHtml + "<td class='p-xxl-1'>"+desc+"</td>\n";
    		innHtml = innHtml + "</tr>\n";
    	}
    	
    	$("#"+obj +" > tbody:last").append(innHtml);
    	//이미지 붙이기
    	for(var i=0 ; i < data.length ; i++){
    		$("#"+obj +"_"+i ).attr("src", data[i].img);
    	}
    	
    }
    
    function fnViewVideo(videoId){
    	
  	   	var link = 'https://www.youtube.com/watch?v='+videoId;
//   	   	window.location.href = link;       //웹개발할때 숨쉬듯이 작성할 코드
//   	   	window.location.replace(link);     // 이전 페이지로 못돌아감
		window.open(link, "_blank");  
    }
   
    
</script>
        
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">예배안내</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">교회소개 > 예배안내</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주일 낮 예배 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										1부 오전 09:00
									</div>
                                    <div class="card-body">
										2부 오전 11:00
									</div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주일저녁예배 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										오후 7:30
									</div>
                                </div>
                            </div>
                        </div>
                        
                      	<div class="row">
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        수요예배 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										오후 7:30
									</div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        금요기도회 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										오후 8:30
									</div>
                                </div>
                            </div>
                        </div>
                        
                      	<div class="row">
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        새벽기도회 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										오전 6:00
									</div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        청년예배 - 본당예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										주일 오후 1:00
									</div>
                                </div>
                            </div>
                        </div>
                        
                      	<div class="row">
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        주일학교예배 - 2층유초등부실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										주일 오전 11:00
									</div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        청소년부예배 - 지하예배실
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3">
                                <div class="card mb-3">
                                    <div class="card-body">
										주일 오전 11:00
									</div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </main>
                
<%@include file="../include/m_footer.jsp" %>

