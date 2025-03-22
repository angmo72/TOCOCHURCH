<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    
    <script type="text/javascript" src="/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.pager.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.sort.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.filter.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.edit.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxcheckbox.js"></script>
        
    <script type="text/javascript" src="/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcalendar.js"></script>
    	<script>
    	$(document).ready(function () {
			$("#btnSave").click(function(){
				fnChurchInfoSave()
			});
			
			fnGetChurchInfo();
    	});
    	
        function fnGetChurchInfo(){
 		  	
        	$.ajax({
		  	    url: '/sys/selectChurchInfo.do',
		  	    method: 'post',
		  	    data:'',		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {
		  	    	
		  	    	if(status == "success"){
						data = data.data[0];
				  	  	$("#frm_CH_NAME").val(data.CH_NAME);
				  	  	$("#frm_CH_PHONE").val(data.CH_PHONE);
				  	  	$("#frm_CH_ZIPCOD").val(data.CH_ZIPCOD);
				  	  	$("#frm_CH_ADDRESS").val(data.CH_ADDRESS);
				  	  	$("#frm_CH_FAX").val(data.CH_FAX);
				  	  	$("#frm_CH_RESNO").val(data.CH_RESNO);
				  	  	$("#frm_CH_LOGO").val(data.CH_LOGO);
				  	  	$("#frm_CH_PASTOR1").val(data.CH_PASTOR1);
				  	  	$("#frm_CH_PHONE1").val(data.CH_PHONE1);
				  	  	$("#frm_CH_PASTOR2").val(data.CH_PASTOR2);
				  	  	$("#frm_CH_PHONE2").val(data.CH_PHONE2);
				  	  	$("#frm_YOUTUBE_LIVE").val(data.YOUTUBE_LIVE);
		  	    	}
		  	    	
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("실폐하였습니다.!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	
        }
    	
        function fnChurchInfoSave(){
        		
        		
        	if($("#frm_CH_NAME").val() == ""){
        		alert("교회명을 입력해주세요.");
        		return false;
        	}
       		
        	if($("#frm_CH_ADDRESS").val() == ""){
        		alert("주소를 등록해주세요");
        		return false;
        	}
        	
	        	
			var frm = $("#frmChurchInfo");
  	    	var informData = frm.serialize();
        	
  	    	var msg ="저장 하시겠습니까?";
        	var result = confirm(msg);
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/sys/saveChurchInfo.do',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("저장 되었습니다.");
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        	
        }
    	</script>
    	
                <main>
                    <div class="container-fluid px-2">
                    	<div>
                        <h4 class="mt-2">교회정보설정</h4>
                        </div>
                        <div>
                        <ol class="breadcrumb mb-2">
                            <li class="breadcrumb-item">시스템설정</li>
                            <li class="breadcrumb-item active">교회정보설정</li>
                        </ol>
                        </div>
                        <div class="card mb-2">
                            <div class="card-body">
	                            <form id="frmChurchInfo" name="frmChurchInfo">
					                <table clase="w-100 ">
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 교회명: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-30" id="frm_CH_NAME" name="frm_CH_NAME" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 전화번호: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-20" id="frm_CH_PHONE" name="frm_CH_PHONE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 팩스: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-20" id="frm_CH_FAX" name="frm_CH_FAX" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 주소: </td>
					                        <td align="left" class="col-xl-7" colspan=3>
					                        	<input class="tbl-form-control w-20" id="frm_CH_ZIPCOD" name="frm_CH_ZIPCOD" />
					                        	<input class="tbl-form-control w-100" id="frm_CH_ADDRESS" name="frm_CH_ADDRESS" />
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 사업자번호: </td>
					                        <td align="left" class="col-xl-3" colspan=3><input class="tbl-form-control w-20" id="frm_CH_RESNO" name="frm_CH_RESNO" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 담임목사: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-30" id="frm_CH_PASTOR1" name="frm_CH_PASTOR1" /></td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-70" id="frm_CH_PHONE1" name="frm_CH_PHONE1" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 부목사: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-30" id="frm_CH_PASTOR2" name="frm_CH_PASTOR2" /></td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-70" id="frm_CH_PHONE2"  name="frm_CH_PHONE2" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 유튜브라이브: </td>
					                        <td align="left" class="col-xl-3" colspan=3><input class="tbl-form-control w-70" id="frm_YOUTUBE_LIVE" name="frm_YOUTUBE_LIVE" /></td>
					                    </tr>
									</table>
										
	                                <div class="mt-4 mb-0">
	                                    <div class="d-grid"><button type="button" class="btn btn-primary" id="btnSave" >저장하기</button></div>
	                                </div>
	                            </form>
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
