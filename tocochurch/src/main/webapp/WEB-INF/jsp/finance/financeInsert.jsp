<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
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
    

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
        $(document).ready(function () {
        	
        	
			//구분
			dsGubunCode = fnGridCodeList("CH012");
			fnSetCodeDiv("frm_gubun", dsGubunCode ,"선택");
// 			fnGetCodeList("frm_gubun", "CH012");
			$('#frm_gubun').val("FN010");
			//항목
			//수입
			dsInCategoryCode = fnGridCodeList("CH005");
			fnSetCodeDiv("frm_category", dsInCategoryCode);
			//지출
			dsOutCategoryCode = fnGridCodeList("CH006");
			
			fnSetCalendar("frm_fndate", "yyyy-MM-dd", "150px");
			
			
			fnSetCodeDiv("srch_gubun", dsGubunCode, "전체");
// 			$('#srch_gubun').val("FN010");
// 			fnSetCodeDiv("srch_category", dsInCategoryCode);
			fnSetCodeDiv("srch_category", "");
			fnSetCalendar("srch_date", "yyyy-MM", "80px");
			
            $('#srch_gubun').on('change', function (event) 
               		{
               		    var args = event.args;
               		    if (args) {
               		    // index represents the item's index.                          
               		    var index = args.index;
               		    var item = args.item;
               		    // get item's label and value.
               		    var label = item.label;
               		    var value = item.value;
               		    var type = args.type; // keyboard, mouse or null depending on how the item was selected.
               		    
               		    if(label == "수입"){
               		    	fnSetCodeDiv("srch_category", dsInCategoryCode);
               		    } else if(label == "지출"){
               		 		fnSetCodeDiv("srch_category", dsOutCategoryCode);
            		    } else {
            		    	$("#srch_category").jqxComboBox('clear');
            		    }
               		}
               	}); 
        	
            datafields1 = [
                    { name: 'FNNO', type: 'string' },
                    { name: 'FNDATE', type: 'string' },
                    { name: 'GUBUN', type: 'string' },
                    { name: 'GUBUN_NM', type: 'string' },
                    { name: 'CATEGORY', type: 'string' },
                    { name: 'CATEGORY_NM', type: 'string' },
                    { name: 'SUB_MEMO', type: 'string' },
                    { name: 'IN_MONEY', type: 'string' },
                    { name: 'OUT_MONEY', type: 'string' },
                    { name: 'REST_MONEY', type: 'string' },
                    { name: 'MEMO', type: 'string' },
                    { name: 'CR_ID', type: 'string' },
                    { name: 'CR_DT', type: 'string' },
                    { name: 'UP_ID', type: 'string' },
                    { name: 'UP_DT', type: 'string' },
                ];
            
            var mainContainer = $('#mainContainer');
            var offset = mainContainer.offset();
            $("#insertPopup").jqxWindow({
                position: { x: offset.left + 100, y: offset.top + 10} ,
                width: 600, resizable: false,  isModal: true, autoOpen: false, 
                cancelButton: $("#btnPopClose"), 
                modalOpacity: 0.01           
            });
            $("#insertPopup").on('open', function () {
//                 $("#fm_GRP_CODE").jqxInput('selectAll');
            });
         
            $("#btnPopSave").jqxButton();
            $("#btnPopDelete").jqxButton();
            $("#btnPopClose").jqxButton();
//             $("#mt_Save").jqxButton();
//             // update the edited row when the user clicks the 'Save' button.
//             $("#mt_Save").click(function () {
//                 mstSave();
//                 $("#grd1Popup").jqxWindow('hide');
//             });
            
            setGrid();
			
			
			
            $('#frm_gubun').on('change', function (event) 
           		{
           		    var args = event.args;
           		    if (args) {
           		    // index represents the item's index.                          
           		    var index = args.index;
           		    var item = args.item;
           		    // get item's label and value.
           		    var label = item.label;
           		    var value = item.value;
           		    var type = args.type; // keyboard, mouse or null depending on how the item was selected.
           		    
           		    if(label == "수입"){
           		    	fnSetCodeDiv("frm_category", dsInCategoryCode);
           		    }
           		 	if(label == "지출"){
           		 		fnSetCodeDiv("frm_category", dsOutCategoryCode);
        		    }
           		    
           		    
           		}
           	}); 
			
			fnSearchFinanceList();
        });
        
        
		var fnViewButton = function(){
            return '<button onClick="fnModifyFinance()" class="btn btn-outline-dark btn-sm" style="margin:5px; width:50px; height:25px">수정</button>';
        };
        function setGrid(){
            $("#grid1").jqxGrid(
            {
                width: "100%",
                pageable: true,
                pagesize :20,
                autoheight: true,
//                 sortable: true,
                altrows: true,
//                 enabletooltips: true,
                editable: false,
// 				filterable: true,
//                 enabletooltips: true,
                enablebrowserselection : true,
//                 selectionmode: 'checkbox',
                selectionmode: 'singlerow',
                columns: [
                  { text: 'FNNO', datafield: 'FNNO', cellsalign: 'center',align: 'center', width: 80, hidden:true},
                  { text: '일자', datafield: 'FNDATE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 100 ,editable : false},
                  { text: '수입/지출', datafield: 'GUBUN', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80, hidden:true},
                  { text: '수입/지출', datafield: 'GUBUN_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80},
                  { text: '항목', datafield: 'CATEGORY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 150 , hidden:true},
                  { text: '항목', datafield: 'CATEGORY_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 150 },
                  { text: '세부내역', datafield: 'SUB_MEMO', columntype: 'textbox', cellsalign: 'left',align: 'center', width: 250 },
                  { text: '수입', datafield: 'IN_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 100, cellsformat: 'd' },
                  { text: '지출', datafield: 'OUT_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 100, cellsformat: 'd' },
                  { text: '잔액', datafield: 'REST_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 130, cellsformat: 'd' },
                  { text: '비고', datafield: 'MEMO', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 250 },
                  { text: '수정', cellsalign: 'center',align: 'center', width: 60, cellsrenderer : fnViewButton, editable : false},
                ]
            });
            $('#grid1').on('rowclick', function (event) 
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
        

        
        //조회
        function fnSearchFinanceList(){
			var url = "/finance/searchFinanceList";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields1,
				data : {
					srch_gubun : $("#srch_gubun").val(),
					srch_category : $("#srch_category").val(),
					srch_date : $("#srch_date").val(),
					srch_sub_memo : $("#srch_sub_memo").val()
					},
				id: 'id',
				url: url
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
			    downloadComplete: function (data, status, xhr) { },
			    loadComplete: function (data) { },
			    loadError: function (xhr, status, error) { }
			});
			
			$("#grid1").jqxGrid({
				source: dataAdapter
			});
			
        }
        
        //등록창 띄우기 
        function fnInsertFrom(){
			$("#insertPopup").jqxWindow('open');
			$("#frm_fnno").val("");
			$("#frm_category").val("");
			$("#frm_money").val("");
			$("#frm_sub_memo").val("");
			$("#frm_memo").val("");
        }
        
        //저장/수정
        function fnFinanceSave(){
        	
        	if($("#frm_gubun").val() == ""){
        		alert("수입/지출은 필수 입니다.");
        		return false;
        	}
        	if($("#frm_category").val() == ""){
        		alert("항목은 필수 입니다.");
        		return false;
        	}
        	if($("#frm_fndate").val() == ""){
        		alert("일자는 필수 입니다.");
        		return false;
        	}
        	if($("#frm_money").val() == ""){
        		alert("금액은 필수 입니다.");
        		return false;
        	}

        	var frm = $("#frmFinacne");
  	    	var informData = frm.serialize();
        	
  	    	var msg ="저장 하시겠습니까?";
  	    	var result = confirm(msg);
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/finance/saveFinanceData',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("정상 처리 되었습니다.");
			  	    	fnSearchFinanceList();
			  	    	
			  	    	$("#frm_fnno").val("");
			  	    	$("#frm_category").val("");
			  	    	$("#frm_money").val("");
			  	    	$("#frm_sub_memo").val("");
			  	    	$("#frm_memo").val("");
			  	    	
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        	
        }
        
        function fnModifyFinance(){
        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
        	var FNNO = $('#grid1').jqxGrid('getcellvalue', mstRow, "FNNO");
        	var FNDATE = $('#grid1').jqxGrid('getcellvalue', mstRow, "FNDATE");
        	var GUBUN = $('#grid1').jqxGrid('getcellvalue', mstRow, "GUBUN");
        	var GUBUN_NM = $('#grid1').jqxGrid('getcellvalue', mstRow, "GUBUN_NM");
        	var CATEGORY = $('#grid1').jqxGrid('getcellvalue', mstRow, "CATEGORY");
        	var SUB_MEMO = $('#grid1').jqxGrid('getcellvalue', mstRow, "SUB_MEMO");
        	var IN_MONEY = $('#grid1').jqxGrid('getcellvalue', mstRow, "IN_MONEY");
        	var OUT_MONEY = $('#grid1').jqxGrid('getcellvalue', mstRow, "OUT_MONEY");
        	var MEMO = $('#grid1').jqxGrid('getcellvalue', mstRow, "MEMO");
        	
        	$("#frm_fnno").val(FNNO);
        	$("#frm_gubun").val(GUBUN);
        	$("#frm_fndate").val(FNDATE);
        	$("#frm_category").val(CATEGORY);
        	if(GUBUN_NM == "수입"){
        		$("#frm_money").val(IN_MONEY);
        	} else {
        		$("#frm_money").val(OUT_MONEY);
        	}
        	$("#frm_sub_memo").val(SUB_MEMO);
        	$("#frm_memo").val(MEMO);
        	        	
        	$("#insertPopup").jqxWindow('open');
        }
        
        function fnFinaceDelete(){
        	if($("#frm_fnno").val() == ""){
        		alert("대상을 선택해주세요!");
        		return false;
        	}

  	    	var msg ="삭제 하시겠습니까?";
  	    	var result = confirm(msg);
        	if(result == true){	
        	
            	var frm = $("#frmFinacne");
      	    	var informData = frm.serialize();
        		
	 		  	$.ajax({
			  	    url: '/finance/deleteFinanceData',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("정상 처리 되었습니다.");
			  	    	fnSearchFinanceList();
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
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">재정관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">재정관리</li>
	                            <li class="breadcrumb-item active">재정등록</li>
	                        </ol>
                        </div>
						<div >
                            <div id="mainContainer" class="card mb-0">
                                <div class="card-header">
                                	<div class="float-start  col-xl-9">
	                               		<div class="w-auto">
											<table clase="w-auto">
							                    <tr>
							                    	<td align="right" class="col-xl-1">
							                        	년월:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-50" id="srch_date" name="srch_date" /></div>
							                        </td>
							                        <td align="right" class="col-xl-1">
							                        	수입/지출:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-50" id="srch_gubun" name="srch_gubun" /></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	항목:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-100"  id="srch_category" name="srch_category"/></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	세부내역:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-100"  id="srch_sub_memo" name="srch_sub_memo"/>
							                        </td>
							                    </tr>
							                </table>
										</div>
                                    </div>
                                    <div class="float-end fcol-xl-3 align-bottom">
										<div class="align-bottom">
											<a class="btn btn-outline-dark btn-sm" href="#" Onclick="fnSearchFinanceList()">조회</a>
											<a class="btn btn-outline-dark btn-sm" href="#" Onclick="fnInsertFrom()">추가</a>
                                     	</div>
                                 	</div>
                                </div>
                         	</div>
							<div id="grid1" class="my-1" ></div>
 								<div id="insertPopup">
 								<div>재정등록/수정</div>
								<div style="overflow: hidden;" class="card-header col-xl-12">
                                   	<div class="p-2">
						                <form id="frmFinacne" name="frmFinacne">
					                	<input type=hidden name="frm_fnno" id="frm_fnno">
						                <table clase="w-auto">
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	일자:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-70" id="frm_fndate"  name="frm_fndate"/></div>
						                        </td>
						                    	<td align="right" class="col-xl-2">
						                        	수입/지출:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-50" id="frm_gubun" name="frm_gubun"/></div>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	항목:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<div class="tbl-form-control w-70"  id="frm_category"  name="frm_category"/></div>
						                        </td>
						                    	<td align="right" class="col-xl-2">
						                        	세부내역:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-100"  id="frm_sub_memo"  name="frm_sub_memo"/>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<td align="right" class="col-xl-2">
						                        	금액:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-70"  id="frm_money"  name="frm_money"/>
						                        </td>
												<td align="right" class="col-xl-2">
						                        	비고:
						                        </td>
						                        <td align="left" class="col-xl-4">
						                        	<input class="tbl-form-control w-100"  id="frm_memo"  name="frm_memo"/>
						                        </td>
						                    </tr>
						                </table>
						                </form>
									</div>
									<div class="float-end align-bottom">
										<button class="btn btn-outline-dark btn-sm" id="btnPopSave" Onclick="fnFinanceSave()">저 장</button>
										<button class="btn btn-outline-dark btn-sm" id="btnPopDelete" Onclick="fnFinaceDelete()">삭 제</button>
										<button class="btn btn-outline-dark btn-sm" id="btnPopClose">닫 기</button>
									</div>
								</div>
							</div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
