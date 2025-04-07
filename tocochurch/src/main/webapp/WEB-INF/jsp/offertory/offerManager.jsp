<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    
    <script type="text/javascript" src="/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.sort.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.pager.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.edit.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.filter.js"></script> 
    
    <script type="text/javascript" src="/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxinput.js"></script>
    
    <script type="text/javascript" src="/jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.aggregates.js"></script>

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
        $(document).ready(function () {
        	
            var mainContainer = $('#mainContainer');
            var offset = mainContainer.offset();
            $("#insertPopup").jqxWindow({
                position: { x: offset.left + 100, y: offset.top + 10} ,
                width: 600, resizable: false,  isModal: true, autoOpen: false,
                height:250,
                cancelButton: $("#btnPopClose"), 
                modalOpacity: 0.01           
            });
            $("#insertPopup").on('open', function () {
//                 $("#fm_GRP_CODE").jqxInput('selectAll');
            });

            $("#printPopup").jqxWindow({
                position: { x: offset.left + 400, y: offset.top + 10} ,
                width: 650, resizable: false,  isModal: true, autoOpen: false,
                height:100,
                cancelButton: $("#btnPrintClose"), 
                modalOpacity: 0.01           
            });
            $("#printPopup").on('open', function () {
//                 $("#fm_GRP_CODE").jqxInput('selectAll');
            });
            
            datafields = [
                { name: 'CHNO', type: 'string' },
                { name: 'IN_DATE', type: 'string' },
                { name: 'GUBUN', type: 'string' },
                { name: 'GUBUN_NM', type: 'string' },
                { name: 'CH_USER_CODE', type: 'string' },
                { name: 'CH_USER_NM', type: 'string' },
                { name: 'USER_NAME', type: 'string' },
                { name: 'MONEY', type: 'string' },
                { name: 'RMK', type: 'string' },
                { name: 'APPR_YN', type: 'string' },
                { name: 'CR_ID', type: 'string' },
                { name: 'CR_DT', type: 'string' },
                { name: 'UP_ID', type: 'string' },
                { name: 'UP_DT', type: 'string' },
                
            ];
            
    		fnGetCodeList("srch_offerType", "CH005");
    		fnGetCodeList("frm_gubun", "CH005");
    		fnGetCodeList("print_gubun", "CH005");
    		
    		var today = new Date();
    		var frmDay = fnAddDay(today, -30);
    		//헌금일
    		fnSetCalendar("srch_offerDateFrom", "yyyy-MM-dd");
    		$('#srch_offerDateFrom').jqxDateTimeInput('setDate', frmDay);
    		
    		fnSetCalendar("srch_offerDateTo", "yyyy-MM-dd");
    		fnSetCalendar("frm_indate", "yyyy-MM-dd");
    		
    		fnGetCodeListUrl("/user/getUserCodeData.do","frm_chUserId");
	      	
    		$('#frm_chUserId').on('change', function (event) 
   			{
   			    var args = event.args;
   			    if (args != undefined && args.index > -1) {
   				    // index represents the item's index.                          
   				    var index = args.index;
   				    var item = args.item;
   				    // get item's label and value.
   				    var label = item.label;
   				    var value = item.value;
   				    var type = args.type; // keyboard, mouse or null depending on how the item was selected.
   				    
   				    $("#frm_chUserNm").val(label);
   				}
   			}); 
    		
            
            setGrid();
			
        });
        function setGrid(){
        	
	       	var fnViewButton = function(){
	            return '<button onClick="fnOfferEdit()" class="btn btn-outline-dark btn-sm" style="margin:5px; width:50px; height:25px">수정</button>';
	        };
	        
            $("#offerGrid").jqxGrid(
            {
                width: "100%",
	            autoheight: true,
	            altrows: true,
	            editable: false,
// 	            enablebrowserselection : true,
// 				showaggregates: true,
// 			    showstatusbar: true,
                pageable: true,
                pagesize: 20,
                autoloadstate: true,			    
             	selectionmode: 'singlerow',
                columns: [
                    { text: '키', datafield: 'CHNO', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                    { text: '구분', datafield: 'GUBUN', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                    { text: '회원코드', datafield: 'CH_USER_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                    { text: '일자', datafield: 'IN_DATE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 120 ,editable : false},
                    { text: '헌금종류', datafield: 'GUBUN_NM', columntype: 'combobox', cellsalign: 'center',align: 'center', width: 120 },
                    { text: '이름', datafield: 'CH_USER_NM', columntype: 'combobox', cellsalign: 'center',align: 'center', width: 120 },
                    { text: '기타이름', datafield: 'USER_NAME', columntype: 'textbox', cellsalign: 'left',align: 'center', width: 200 },
                    { text: '금액', datafield: 'MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: '150', cellsformat: 'd'},
                    { text: '비고', datafield: 'RMK', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 300 },
                    { text: '수정', cellsalign: 'center',align: 'center', width: 60, cellsrenderer : fnViewButton, editable : false},
                ]
            });
        }

        function searchOffer(){
        	//서머리 조회
        	searchOfferSum();

			var url = "/offertory/offerList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				data : {
					srch_offerDateFrom : $("#srch_offerDateFrom").val(),
					srch_offerDateTo : $("#srch_offerDateTo").val(),
					srch_offerType : $("#srch_offerType").val(),
					srch_userNm : $("#srch_userNm").val(),
					},
				datafields: datafields1,
				id: 'id',
				url: url
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
			    downloadComplete: function (data, status, xhr) { },
			    loadComplete: function (data) { },
			    loadError: function (xhr, status, error) { }
			});
			
			$("#offerGrid").jqxGrid({
				source: dataAdapter
			});
			
        	
        }
        
        function searchOfferSum(){
	  	    	
        	$.ajax({
		  	    url: '/offertory/offerListSum.do',
		  	    method: 'post',
				data : {
					srch_offerDateFrom : $("#srch_offerDateFrom").val(),
					srch_offerDateTo : $("#srch_offerDateTo").val(),
					srch_offerType : $("#srch_offerType").val(),
					srch_userNm : $("#srch_userNm").val(),
					srch_appr_yn : 'Y',
					},    
		  	    dataType : 'json',
		  	  	
		  	    success: function (data, status, xhr) {
// 		  	    	$("#summaryList").html()
					var totalSum = 0;
					var viewSum ="";
					var sumdata = data.data;
					for(var i = 0 ; i < sumdata.length ; i++){
						totalSum = totalSum + sumdata[i].SUM_MONEY;
						viewSum = viewSum  + sumdata[i].GUBUN_NM + "  :  " + fnAddComma(sumdata[i].SUM_MONEY) + "  &nbsp;|&nbsp;  ";
					}
					viewSum = viewSum + " 전체금액   :   " +  fnAddComma(totalSum)	;
					
					$("#summaryList").html(viewSum)
					
					var dateList = data.dateList;
					fnSetCodeDiv("print_indate", dateList, "선택");
					
		  		},
		  	    error: function (data, status, err) {
		  	    	alert("서머리 조회 오류!");
		  	    },
		  	    complete: function () {
	  	    	}
	  		});
        	
        }

        function fnOfferEdit(){
        	var mstRow = $('#offerGrid').jqxGrid('getselectedrowindex');
        	var CHNO = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "CHNO");
        	var IN_DATE = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "IN_DATE");
        	var GUBUN = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "GUBUN");
        	var MONEY = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "MONEY");
        	var CH_USER_NM = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "CH_USER_NM");
        	var CH_USER_CODE = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "CH_USER_CODE");
        	var USER_NAME = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "USER_NAME");
        	var RMK = $('#offerGrid').jqxGrid('getcellvalue', mstRow, "RMK");
        	
        	$("#frm_chno").val(CHNO);
        	$("#frm_indate").val(IN_DATE);
        	$("#frm_gubun").val(GUBUN);
        	$("#frm_money").val(MONEY);
        	$("#frm_oldMoney").val(MONEY);
        	$("#frm_chUserId").val(CH_USER_CODE);
        	$("#frm_chUserNm").val(CH_USER_NM);
        	$("#frm_userNm").val(USER_NAME);
        	$("#frm_rmk").val(RMK);
        	$("#frm_reason").val("");
        	        	
        	$("#insertPopup").jqxWindow('open');
        }
            
        function offerExcelSave(){
        	alert("준비중입니다.");
        }
        
        function fnOfferSave(){
        	
			if($("#frm_chno").val() == "" ){
        		alert("헌금을 선택해주세요");
        		return false;
        	}
			if($("#frm_indate").val() == "" ){
				alert("일자를 선택해주세요.");
				return false;
			}
			if($("#frm_money").val() == "" ){
				alert("금액 입력은 필수 입니다.");
				return false;
			}
			if($("#frm_chUserId").val() == "" ){
				alert("이름을 등록해주세요.");
				return false;
			}
			if($("#frm_reason").val() == "" ){
				alert("사유를 등록해주세요!");
				return false;
			}
			
  	    	var msg ="저장 하시겠습니까?";
  	    	var result = confirm(msg);
        	if(result == true){	
			
				$("#mode").val("UPDATE");
	
				var frm = $("#frmOffer");
	  	    	var informData = frm.serialize();
	  	    	
	        	$.ajax({
			  	    url: '/offertory/updateMngOfferInfo.do',
			  	    method: 'post',
			  	    data: informData,	  	    
			  	    dataType : 'json',
			  	  	
			  	    success: function (data, status, xhr) {
				  	    alert("정상 처리 되었습니다.");
			            $("#frm_chno").val("");
			            $('#insertPopup').jqxWindow('close');
			            searchOffer();
			  		},
			  	    error: function (data, status, err) {
			  	    	alert("저장시 오류가 발생되었습니다!");
			  	    },
			  	    complete: function () {
		  	    	}
		  		});
        	}
        	
        }
        
        function fnOfferDelete(){
			if($("#frm_chno").val() == "" ){
        		alert("헌금을 선택해주세요");
        		return false;
        	}

			if($("#frm_reason").val() == "" ){
				alert("사유를 등록해주세요!");
				return false;
			}
			
  	    	var msg ="삭제 하시겠습니까?";
  	    	var result = confirm(msg);
        	if(result == true){	
        		
				$("#mode").val("DELETE");
				
				var frm = $("#frmOffer");
	  	    	var informData = frm.serialize();
	  	    	
	        	$.ajax({
			  	    url: '/offertory/deletMngOfferInfo.do',
			  	    method: 'post',
			  	    data: informData,	  	    
			  	    dataType : 'json',
			  	  	
			  	    success: function (data, status, xhr) {
				  	    alert("삭제 처리 되었습니다.");
			            $("#frm_chno").val(""); 
			            $('#insertPopup').jqxWindow('close');
			            searchOffer();
			  		},
			  	    error: function (data, status, err) {
			  	    	alert("삭제시 오류가 발생되었습니다!");
			  	    },
			  	    complete: function () {
		  	    	}
		  		});
        	}
        }
        
        function offerPrint(){
        	
        	var rows = $('#offerGrid').jqxGrid('getrows');
        	if(rows.length <= 0){
				alert("먼저 검색 해주세요!");        		
        	} else {
        		$("#printPopup").jqxWindow('open');
        	}
        	

        }
        
		function fnPrintOfferAct(){
			var srch_indate = $("#print_indate").val();
			var srch_gubun = $("#print_gubun").val();
    		var url = '/offertory/offerPrint.do?srch_indate='+srch_indate+'&srch_gubun='+srch_gubun;
    		window.open(url, 'window',
    		  'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=800,height=840, scrollbars=yes'
    		);
        }
        
    </script>
                <main>
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">헌금관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">헌금관리</li>
	                            <li class="breadcrumb-item active">헌금조회</li>
	                        </ol>
                        </div>
						<div >
                           <div id="mainContainer" class="card">
                               <div class="card-header col-xl-12">
                                	<div class="float-start col-xl-1-9">
	                                 	<form id="formSearch" name="formSearch">
	                                 	<input type="hidden" id="mode" name="mode">
						                <table clase="w-auto" style="width:1000px">
						                    <tr>
						                    	<td align="right" class="col-xl-1">
						                        	일자:
						                        </td>
						                        <td align="left" class="col-xl-2">
						                        	<div class="tbl-form-control w-70" id="srch_offerDateFrom" name="srch_offerDateFrom"></div>
						                        </td>
						                    	<td align="right" class="col-xl-1">
						                        	일자:
						                        </td>
						                        <td align="left" class="col-xl-2">
						                        	<div class="tbl-form-control w-70" id="srch_offerDateTo" name="srch_offerDateTo"></div>
						                        </td>
						                    	<td align="right" class="col-xl-1">
						                        	헌금종류:
						                        </td>
						                        <td align="left" class="col-xl-2">
						                        	<div class="tbl-form-control w-70" id="srch_offerType" name="srch_offerType"></div>
						                        </td>
						                    	<td align="right" class="col-xl-1">
						                        	이름:
						                        </td>
						                        <td align="left" class="col-xl-2">
						                        	<input class="tbl-form-control w-100" id="srch_userNm" id="srch_userNm" />
						                        </td>
						                    </tr>
						                </table>
						                </form>
                                    </div>
                                    <div class="float-end fcol-xl-3 align-bottom">
                                     <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchOffer()">조 회</a>
                                     <a class="btn btn-outline-dark btn-sm" href="#" Onclick="offerExcelSave()">엑셀저정</a>
                                     <a class="btn btn-outline-dark btn-sm" href="#" Onclick="offerPrint()">인쇄</a>
                                    </div>
                               </div>
                       		</div>
                            <div class="col-xl-12 mt-1">
                                <div class="card mb-3">
                                    <div class="card-body" id="summaryList">
									</div>
                                </div>
                            </div>
							<div id="offerGrid" class="my-1" ></div>
							
 								<div id="insertPopup" style="display:none">
 								<div>헌금/수정</div>
								<div style="overflow: hidden;" class="card-header col-xl-12">
                                   	<div class="p-2">
						                <form id="frmOffer" name="frmOffer">
					                	<input type=hidden name="frm_chno" id="frm_chno">
						                <table clase="w-auto">
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	일자:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-70" id="frm_indate"  name="frm_indate"/></div>
						                        </td>
						                    	<td align="right" class="col-xl-2">
						                        	헌금종류:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-50" id="frm_gubun" name="frm_gubun"/></div>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	금액:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-50"  id="frm_money" name="frm_money" />
						                        	<input class="tbl-form-control w-50"  id="frm_oldMoney" name="frm_oldMoney" type="hidden"/>
						                        </td>
						                    	<td align="right" class="col-xl-2">
						                        	이름:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-50" id="frm_chUserId" name="frm_chUserId"></div>
						                        	<input type="hidden" id="frm_chUserNm" name="frm_chUserNm">
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	기타이름:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-100"  id="frm_userNm" name="frm_userNm"/>
						                        </td>
												<td align="right" class="col-xl-2">
						                        	비고:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-100"  id="frm_rmk" name="frm_rmk"/>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	사유:
						                        </td>
						                        <td align="left" class="col-xl-10" colspan="3">
						                        	<input class="tbl-form-control w-100"  id="frm_reason"  name="frm_reason"/>
						                        </td>
						                    </tr>
						                </table>
						                </form>
									</div>
									<div class="float-end align-bottom">
										<button class="btn btn-outline-dark btn-sm" id="btnPopSave" Onclick="fnOfferSave()">저 장</button>
										<button class="btn btn-outline-dark btn-sm" id="btnPopDelete" Onclick="fnOfferDelete()">삭 제</button>
										<button class="btn btn-outline-dark btn-sm" id="btnPopClose">닫 기</button>
									</div>
								</div>
							</div>
							
							<div id="printPopup" style="display:none">
 								<div>헌금 출력</div>
								<div style="overflow: hidden;" class="card-header col-xl-12">
                                   	<div class="p-2">
						                <table clase="w-auto">
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	헌금일자:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-80" id="print_indate"  name="print_indate"/></div>
						                        </td>
						                    	<td align="right" class="col-xl-2">
						                        	헌금종류:
						                        </td>
						                        <td align="left" class="col-xl-3">
						                        	<div class="tbl-form-control w-80" id="print_gubun" name="print_gubun"/></div>
						                        </td>
						                        <td align="left" class="col-xl-3">
													<div class="float-end align-bottom">
														<button class="btn btn-outline-dark btn-sm" id="btnPrintAct" Onclick="fnPrintOfferAct()">인쇄</button>
														<button class="btn btn-outline-dark btn-sm" id="btnPrintClose">닫 기</button>
													</div>
						                        </td>
						                    </tr>
						                </table>
									</div>
								</div>
							</div>
							
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
