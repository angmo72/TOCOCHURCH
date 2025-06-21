<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/m_header.jsp" %>
<script type="text/javascript">
    var datafields = "";
    var menuCrtDatadaptor = "";
    $(document).ready(function () {
   	
    	// 수요예배
    	fnWorshipSearch("wendWorshipTable","PLKjnkDLEDs8luKnYrN3EQCyQgBP1H0Fhm",50);
    	
    });
    
    function fnWorshipSearch(traget, playId, maxList){
   	
	  	$.ajax({
	  	    url: '/youtube/playList.do',
	  	    method: 'get',
	  	    data: {
	  	    		playList:playId,
	  	    		maxList:maxList,
	  	    	},		  	    
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
    	
    	var innHtml ="";
    	
    	for(var i=0 ; i < data.length ; i++){
	    	var title = data[i].title;
	    	var desc = data[i].desc;
	    	
// 	    	if(title.length >= 16){ title = title.substring(0,14)+"...";}
// 	    	if(desc.length >= 34){ desc = desc.substring(0,34)+"...";}
	    	
    		innHtml = innHtml + "<tr style='cursor:pointer' onclick='fnViewVideo(\""+data[i].id+"\")'>\n";
    		innHtml = innHtml + "<td rowspan='2' class='p-xxl-1'><img id='"+obj +"_"+i+"' sre='"+data[i].img+"' width='200' height='150'></td>\n";
    		innHtml = innHtml + "<td><b>주제  : "+title+"</b></td>\n";
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
                        <h1 class="mt-4">수요예배말씀</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Wednesday Worship Sermon</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        수요예배말씀
                                    </div>
                                    <div class="card-body">
		                                <table id="wendWorshipTable">
		                                    <tbody>
		                                    </tbody>
		                                </table>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
<%@include file="../include/m_footer.jsp" %>

