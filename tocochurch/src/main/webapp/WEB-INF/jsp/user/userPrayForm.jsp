<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
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

    <script type="text/javascript">
    	var datafields = "";
		var prno = '<%=request.getAttribute("srch_prno") %>';
        $(document).ready(function () {

			//구분
			fnGetCodeList("frm_gubun", "CH007");
			//상태
			fnGetCodeList("frm_status", "CH008");
			
			
			//시작일
			fnSetCalendar("frm_sdate", "yyyy-MM-dd");
			//종료일
			fnSetCalendar("frm_edate", "yyyy-MM-dd");
			$("#frm_edate").val("");
			
			if(prno == null || prno == ""){			
				$("#frm_mode").val("INSERT");
				$("#btnPrayDelete").addClass("d-none"); //버튼 숨김
				$("#prayDtForm").addClass("d-none");
				$("#frm_dt_mode").val("INSERT");
			} else { 
				$("#frm_mode").val("UPDATE");
				$("#btnPrayDelete").removeClass("d-none"); //버튼 보임
				$("#prayDtForm").removeClass("d-none");
				$("#frm_dt_mode").val("INSERT");
				$("#frm_dt_prno").val(prno);
				
	            setGrid();
	            
				//중보기도내용
				fnSelectPrayOneData();
				
				//응답과정
				fnSelectPrayDtData();

			}
			
			
            datafields = [
                { name: 'ROW_NO', type: 'string' },
                { name: 'DTNO', type: 'string' },
                { name: 'PRNO', type: 'string' },
                { name: 'MEMO', type: 'string' },
                { name: 'MEMO_VIEW', type: 'string' },
                { name: 'UP_DT', type: 'string' },
                { name: 'UP_ID', type: 'string' }
            ];
			
        });
        
        
        function setGrid(){
        	
        	var cellclass = function (row, columnfield, value) {
        		return 'lh-base';
        	}
        	
            $("#grid").jqxGrid(
            {
                width: "100%",
//                 pageable: true,
//                 pagesize: 15,
//                 pagermode: 'simple',
                autorowheight: true,
                autoheight: true,
                altrows: true,
                rowsheight: 100,
//                 sortable: true,
//                 enabletooltips: true,
                editable: false,
// 				filterable: true,
//                 enabletooltips: true,
//                 enablebrowserselection : true,
//                 selectionmode: 'checkbox',
                selectionmode: 'singlerow',
                columns: [
                  { text: 'NO', datafield: 'ROW_NO', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 60 ,editable : false },
                  { text: 'DTNO', datafield: 'DTNO', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false, hidden:true, },
                  { text: 'PRNO', datafield: 'PRNO', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false, hidden:true, },
                  { text: '내용', datafield: 'MEMO', columntype: 'textbox', cellsalign: 'left', align: 'center', hidden: true, editable : false},
                  { text: '내용', datafield: 'MEMO_VIEW', columntype: 'textbox', cellsalign: 'left', align: 'center', cellclassname: cellclass, editable : false},
                  { text: '수정', datafield: 'Edit', columntype: 'button', cellsalign: 'center',align: 'center',  width: 60 ,cellsrenderer: function () {
                      return "수정";
	                   }, buttonclick: function (row) {
	                      // open the popup window when the user clicks a button.
	                      editrow = row;
	                      var dataRecord = $("#grid").jqxGrid('getrowdata', editrow);
	                      $("#frm_dt_mode").val("UPDATE");
	                      $("#frm_dt_dtno").val(dataRecord.DTNO);
	                      $("#frm_dt_prno").val(dataRecord.PRNO);
	                      $("#frm_dt_memo").val(dataRecord.MEMO);
	                      
	                  }
                  },
                  { text: '수정자', datafield: 'UP_ID', cellsalign: 'center',align: 'center', width: 120, editable : false },
                  { text: '수정일', datafield: 'UP_DT', cellsalign: 'center',align: 'center', width: 100, editable : false },
                ]
            });
            $('#grid').on('rowclick', function (event) 
         		{
         		    var args = event.args;
         		    // row's bound index.
         		    var boundIndex = args.rowindex;
         		    // row's visible index.
         		    var visibleIndex = args.visibleindex;
         		    // right click.
         		    var rightclick = args.rightclick; 
         		    // original event.
         		    var ev = args.originalEvent;  
         		}); 
        }
        
        function fnSelectPrayOneData(){
            	
        	if(prno != null){
        		
	 		  	$.ajax({
			  	    url: '/user/selectPrayOneData.do',
			  	    method: 'post',
			  	    data: { srch_prno:prno },		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	if(status == "success"){
							data = data.data;
							$("#frm_prno").val(data.PRNO);
							$("#frm_user_code").val(data.USER_CODE);
							$("#frm_user_nm").val(data.USER_NM);
							$("#frm_gubun").val(data.GUBUN);
							$("#frm_status").val(data.STATUS);
							$("#frm_subject").val(data.SUBJECT);
							$("#frm_sdate").val(data.SDATE);
							$("#frm_edate").val(data.EDATE);
							$("#frm_memo").val(data.MEMO);
			  	    	}
			  	    	
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
            	
        }
		
        
        function fnSearchUser(){
        	fnCommUserSearch("new","fnPlayerPop");
        }
        function fnPlayerPop(data){
        	
        	$("#frm_user_code").val(data.USER_CODE);
        	$("#frm_user_nm").val(data.USER_NM);
        	
        }
        
        function fnPraySave(){
        	if($("#frm_mode").val() != "DELETE" ){
        		
	        	if($("#frm_user_nm").val() == ""){
	        		alert("성도는 선택해주세요.");
	        		return false;
	        	}
	        	if($("#frm_gubun").val() == ""){
	        		alert("구분을 선택해주세요.");
	        		return false;
	        	}
	        	if($("#frm_status").val() == ""){
	        		alert("상태를 선택해주세요.");
	        		return false;
	        	}
	        	if($("#frm_subject").val() == ""){
	        		alert("제목을 등록해주세요.");
	        		return false;
	        	}
	        	if($("#frm_memo").val() == ""){
	        		alert("내용을 등록해주세요.");
	        		return false;
	        	}
	        	
	        	if(($("#frm_memo").val() == "UPDATE" || $("#frm_memo").val() == "DELETE") && $("#frm_prno").val() == "" ){
	        		alert("선택된 기도내용이 없습니다. ");
	        		return false;
	        	}
	        	
        	}	        	
	        	
			var frm = $("#frmPray");
  	    	var informData = frm.serialize();
        	
  	    	var msg ="하시겠습니까?";
  	    	if($("#frm_mode").val() =="INSERT") msg = "저장 " + msg; 
  	    	if($("#frm_mode").val() =="UPDATE") msg = "수정 " + msg; 
  	    	if($("#frm_mode").val() =="DELETE") msg = "삭제 " + msg; 
  	    	
  	    	
        	var result = confirm(msg);
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/user/savePrayData.do',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("정상 처리 되었습니다.");
			  	    	var mode = $("#frm_mode").val();
			  	    	if(mode == "INSERT" || mode == "DELETE"){
			  	    		fnPrayList();
			  	    	} else {
			  	    		fnSelectPrayOneData();
			  	    	}
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        	
        }
        
        function fnPrayDelete(){
        	$("#frm_mode").val("DELETE");
        	fnPraySave();
        }
        
        function fnPrayList(){
        	document.location.href="/user/userPray.do";
        }
        
        //응답과정
        function fnSelectPrayDtData(){
        	
        	$('#grid').jqxGrid('clear');
        	
			var url = "/user/selectPrayDtList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				data : {srch_prno : prno},
				datafields: datafields,
				id: 'id',
				url: url,
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
			    downloadComplete: function (data, status, xhr) { },
			    loadComplete: function (data) { },
			    loadError: function (xhr, status, error) { }
			});
			
			$("#grid").jqxGrid({
				source: dataAdapter
			});
        	
        }
        
        function fnPrayDtSave(){
        	if($("#frm_dt_mode").val() != "DELETE" ){
        		
        		
	        	if($("#frm_dt_prno").val() == ""){
	        		alert("중보기도가 선택되지 않았습니다.");
	        		return false;
	        	}
        		
	        	if($("#frm_dt_memo").val() == ""){
	        		alert("내용을 등록해주세요");
	        		return false;
	        	}
	        	
        	}	        	
	        	
			var frm = $("#frmDtPray");
  	    	var informData = frm.serialize();
        	
  	    	var msg ="하시겠습니까?";
  	    	if($("#frm_dt_mode").val() =="INSERT") msg = "저장 " + msg; 
  	    	if($("#frm_dt_mode").val() =="UPDATE") msg = "수정 " + msg; 
  	    	if($("#frm_dt_mode").val() =="DELETE") msg = "삭제 " + msg; 
  	    	
  	    	
        	var result = confirm(msg);
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/user/savePrayDtData.do',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("정상 처리 되었습니다.");

			  	    	fnSelectPrayDtData();
		  	    		
		  	    		$("#frm_dt_dtno").val("");
		  	    		$("#frm_dt_mode").val("INSERT");
		  	    		$("#frm_dt_memo").val("");
		  	    		
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        	
        }
        
        
        function fnPrayDtDelete(){
        	$("#frm_dt_mode").val("DELETE");
        	fnPrayDtSave();
        }
        
        
    </script>
                <main>
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">중보기도 및 관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">교인관리</li>
	                            <li class="breadcrumb-item active">중보기도 등록 및 수정</li>
	                        </ol>
                        </div>
						<div class="row p-2">
							<div style="width:100%">
                                <div class="card" >
	                                <div class="card-header" >
	                                	<div class="float-start">
											중보기도
	                                	</div>
										<div class="float-end align-bottom">
											<button class="btn btn-outline-dark btn-sm" id="btnPraySave" Onclick="fnPraySave()">저 장</button>
											<button class="btn btn-outline-dark btn-sm" id="btnPrayDelete" Onclick="fnPrayDelete()">삭 제</button>
											<button class="btn btn-outline-dark btn-sm" id="btnPrayClose" Onclick="fnPrayList()">목록가기</button>
										</div>
	                                </div>
                                </div>
                                <div class="card">
	                                <div class="card-body col-xl-12">
						                <form id="frmPray" name="frmPray">
					                	<input type=hidden name="frm_prno" id="frm_prno">
					                	<input type=hidden name="frm_mode" id="frm_mode">
						                <table clase="w-100" style="width:100%">
						                    <tr>
						                    	<td align="right" class="col-xl-1">
						                        	성도:
						                        </td>	
						                        <td align="left" class="col-xl-3">
				                                	<div class="float-start">
								                        <input class="tbl-form-control w-80" type="hidden"   id="frm_user_code"  name="frm_user_code"/>
								                        <input class="tbl-form-control w-80" id="frm_user_nm"  name="frm_user_nm" readOnly />
				                                	</div>
				                                	<div>
				                                		<input type="button" class="btn btn-outline-dark btn-sm" id="btnPopClose" Onclick="fnSearchUser();" value="성도검색"/>
				                                	</div>
						                        </td>
						                    	<td align="right" class="col-xl-1">
						                        	구분:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-30" id="frm_gubun" name="frm_gubun"/></div>
						                        </td>
						                        <td align="right" class="col-xl-1">
						                        	상태:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-30" id="frm_status" name="frm_status"/></div>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-1">
						                        	제목:
						                        </td>
						                        <td align="left" class="col-xl-11" colspan="5">
						                        	<input type="text" class="tbl-form-control w-70"  id="frm_subject"  name="frm_subject"/>
						                        </td>
											</tr>
						                    <tr>					                        
						                    	<td align="right" class="col-xl-1">
						                        	시작일:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-50"  id="frm_sdate"  name="frm_sdate"/></div>
						                        </td>
						                    	<td align="right" class="col-xl-1">
						                        	종료일:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-50"  id="frm_edate"  name="frm_edate"/></div>
						                        </td>
						                        <td align="right" class="col-xl-1">
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-1">
						                        	내용:
						                        </td>
						                        <td align="left" class="col-xl-11" colspan="5">
						                        	<textarea class="tbl-form-control w-100"  id="frm_memo"  name="frm_memo" rows="6"></textarea>
						                        </td>
						                    </tr>
						                </table>
						                </form>
	                                </div>
                                </div>
                            </div>
						</div>
						<div class="row p-2 d-none" id="prayDtForm"  >
							<div class="col-xl-12" >
                                <div class="card">
	                                <div class="card-header" >
	                                	<div class="float-start">
											응답과정
	                                	</div>
										<div class="float-end">
											<button class="btn btn-outline-dark btn-sm" id="btnPrayDtSave" Onclick="fnPrayDtSave()">저 장</button>
											<button class="btn btn-outline-dark btn-sm" id="btnPrayDelete" Onclick="fnPrayDtDelete()">삭 제</button>
										</div>
										<br><p style="heght:5px"></p>
	                                	<div>
							                <form id="frmDtPray" name="frmPray">
						                	<input type=hidden name="frm_dt_dtno" id="frm_dt_dtno">
						                	<input type=hidden name="frm_dt_prno" id="frm_dt_prno">
						                	<input type=hidden name="frm_dt_mode" id="frm_dt_mode">
											<textarea class="tbl-form-control"  id="frm_dt_memo"  name="frm_dt_memo" rows="3"></textarea>
				                            </form>
	                                	</div>
	                                </div>
                                </div>
                                <div id="grid" class="my-1" ></div>
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
