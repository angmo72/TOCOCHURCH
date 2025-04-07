<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/styles.css" rel="stylesheet" />
<script src="/js/all.js" crossorigin="anonymous"></script>
<script src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/chrch.js"></script>
<style>
	@media print {
		@page {
			size:210mm 297mm;	/* 실제 인쇄용지 크기 지정 */
			margin:0mm
		}
		
		/* 프린트할때 background-color 나오게 하기 */
		* {
			-webkit-print-color-adjust: exact !important;   /* Chrome, Safari 6 – 15.3, Edge */
			color-adjust: exact !important;                 /* Firefox 48 – 96 */
			print-color-adjust: exact !important;           /* Firefox 97+, Safari 15.4+ */
		}
		
	     .page-divide {
	            page-break-after: always;
	     }
	     .no-print-page {
	
	            display: none; //작업의 편리함을 위해 넣은 페이지 구분선. 프린트 시에는 보이지 않음
	      }
		
		/* 프린트할때 아래쪽에 빈페이지 생기는것 방지 : height: auto; */
		body {
			margin: 30px;
			padding: 0;
			height: auto;
			font-size: 12px;
			margin-top: 50px;	/* 아래 pop_from_fix 의 margin-top을 적절히 조절해서 위치를 조정한다. */
		}
		.pop_from_fix { transform: scale(1.35); margin-top: 50px; }

		.pop_from_fix_btn { display:none; }	/* 프린트할때 버튼 숨기기 */
	}
		
  	hr {
	    color: #ccc;
	    background-color: #ccc;
	}
	h1, h2, h3, h4, h5, h6, code, pre {
	    color: #000;
	    text-transform: none; /* because sometimes I set all-caps */
	}
	h1 {
	    font-size: 12pt;
	    margin-top: 1em;
	    font-weight: bold;
	}
	h2 {
	    font-size: 10pt;
	}
	h3 {
	    font-size: 9pt;
	}
	h4 {
	    font-size: 8pt;
	}
	.sector{
		margin-left: 30px;
		margin-right: 30px;
	}
	.table {
	       width: 100%;
	       max-width: 100%;
	       margin-bottom: .5rem;
	}
	thead {
	       display: table-header-group;
	       vertical-align: middle;
	       border-color: inherit;
	}
	tbody {
	       display: table-row-group;
	       vertical-align: middle;
	       border-color: inherit;
	}
	.table th {
	       padding: .15rem;
	       vertical-align: middle;
	       text-align: center;
	       border-color: #efefef;
	       border: 1px solid #cccccc;
	}
	.table td {
	       padding: .15rem;
	       padding-right: .2rem;
	       vertical-align: middle;
	       text-align: center;
	       border: 1px solid #cccccc;
	}
	.al_right{
		text-align: right !important;
		padding-right: 10px !important;
	}
	.al_center{
		text-align: center;
	}
	.title{
	    font-size: 12pt;
	    margin-top: 5px;
	    font-weight: bold;
	}	
	.pop_from_fix_btn { text-align: center;}
	.pop_from_fix_btn a { display: inline-block; line-height: 26px; text-align: center; padding: 0 20px; background-color: #000; color: #fff; font-weight: 600; font-size: 14px; text-decoration: none;}
	.pop_from_fix_btn a:first-child { background-color: #2a2e87;}
</style>
<script>

var srch_indate = '<%=request.getAttribute("srch_indate") %>';

$(document).ready(function () {
	searchOffer();
});

function searchOffer(){
	
   	$.ajax({
  	    url: '/offertory/offerPrintList.do',
  	    method: 'post',
		data : {
			srch_printDate : srch_indate,
			srch_offerType : '<%=request.getAttribute("srch_gubun") %>'
			},    
  	    dataType : 'json',
  	    success: function (data, status, xhr) {
			fnViewPage(data);
  		},
  	    error: function (data, status, err) {
  	    	alert("서머리 조회 오류!");
  	    },
  	    complete: function () {
	    	}
		});
 	
}

function fnViewPage(data){
	var sumData = data.dataSum;
	var listData = data.dataList;
	
	totalMoney = "￦ " + fnAddComma(getSumMoney(sumData,"전체"));
	$("#frmTotalPrice").text(totalMoney);

// 	<span class='title float-start'>십일조</span> 
// 	<span class="title float-end pe-2'>\ 1,560,000</span>
	
	var sectorS ="<div class='sector'>\n";
	var sectorE ="</div>\n\n";
	var headhtml = "";
	headhtml += "<table class='table'>\n";
	headhtml += "<colgroup> \n";
	headhtml += "<col style='width:8%'>\n";
	headhtml += "<col style='width:27%'>\n";
	headhtml += "<col style='width:15%'>\n";
	headhtml += "<col style='width:8%'>\n";
	headhtml += "<col style='width:27%'>\n";
	headhtml += "<col style='width:15%'>\n";
	headhtml += "</colgroup>\n";
	headhtml += "<thead>\n";
	headhtml += "<tr>\n";
	headhtml += "<th>No</th>\n";
	headhtml += "<th>이름</th>\n";
	headhtml += "<th>금액</th>\n";
	headhtml += "<th>No</th>\n";
	headhtml += "<th>이름</th>\n";
	headhtml += "<th>금액</th>\n";
	headhtml += "</tr>\n";
	headhtml += "</thead>\n";
	headhtml += "<tbody>\n";
	
	var foothtml = "</tbody>\n";
	foothtml += "</table>\n";
	
	var subTitle = "";
	var innerHtml = "";
	var subSumMoney = 0;
	var rowcnt = 0;
	for(var i = 0 ; i < listData.length ; i++){
		var rowData = listData[i];
		rowcnt++;
		if(subTitle != rowData.GUBUN_NM){
			rowcnt=1;
			if(subTitle != ""){
				innerHtml += foothtml;
				innerHtml += sectorE;
			} 
			

			innerHtml += sectorS;
			subSumMoney = "￦ " + fnAddComma(getSumMoney(sumData,rowData.GUBUN_NM));
			innerHtml +="<span class='title float-start'>"+ rowData.GUBUN_NM +"</span>\n";
			innerHtml +="<span class='title float-end pe-2'>"+ subSumMoney +"</span>\n";
			innerHtml += headhtml;
			
			subTitle = rowData.GUBUN_NM;
		}
		
		if(rowcnt%2 ==1)
			innerHtml += "<tr>";
			
		innerHtml += "<td class='al_center'>"+rowcnt+"</td>\n";
		innerHtml += "<td>"+rowData.CH_USER_NM+"</td>\n";
		innerHtml += "<td class='al_right'>￦ " +rowData.MONEY+"</td>\n";
		
		if(rowcnt%2 ==0)
			innerHtml += "<tr>\n";
		
		
	}
	
	innerHtml += foothtml;
	innerHtml += sectorE;
	
	$("#startDiv").after(innerHtml);
	
}

function getSumMoney(sumData, gubun){
	var reValue = 0;
	var rows = sumData.length;
	for(var i = 0 ; i < rows ; i++ ){
		rowData = sumData[i];
		
		if(gubun != "전체"){
			if(gubun == rowData.GUBUN_NM){
				reValue = rowData.SUM_MONEY;
			} 
		} else {
			reValue += rowData.SUM_MONEY;
		}	
	}
	
	return reValue;	
}
</script>

</head>
<body>
	<div class="sector" id="startDiv">
	<table class="table">
		<thead>
			<tr>
				<th>날짜</th>
				<td class="title" id="frmIndate"><%=request.getAttribute("srch_indate") %></td>
				<th>총 금액</th>
				<td class="title al_right"  id="frmTotalPrice">\ 1,369,336</td>
			</tr>
		</thead>
	</table>
	</div>

	<div class="pop_from_fix_btn">
		<a href="javascript:window.print()">인쇄하기</a>
		<a href="javascript:window.close()">닫기</a>
	</div>
</body>
</html>