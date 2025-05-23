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
	var dsZoneCode = "";
	var dsGenderCode = "";
	var dsBaptismCode = "";
	var dsDutyCode = "";
    $(document).ready(function () {
      	
		$("#offer_amount").on("keyup",function(key){
			if(key.keyCode==13) {
				addOfferDt();
			}     
		});
    	
		fnGetCodeList("offer_type", "CH005");
	
		//헌금일
		fnSetCalendar("offer_date", "yyyy-MM-dd");
		
		fnGetCodeListUrl("/user/getUserCodeData.do","offer_id");
	      	
		$('#offer_id').on('change', function (event) 
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
				    
				    $("#offer_name").val(label);
				}
			}); 
	
          datafields1 = [
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
         
          
          setGrid();
          searchOffer();


      });
                       
        function setGrid(){
        	
        	var fnViewButton = function(){
	            return '<button onClick="fnOfferEditable()" class="btn btn-outline-dark btn-sm" style="margin:5px; width:50px; height:25px">수정</button>';
	        };
	        
            $("#offer_grid").jqxGrid(
            {
                width: "100%",
                pageable: false,
                autoheight: true,
//                 sortable: true,
                altrows: true,
//                 enabletooltips: true,
                editable: false,
// 				filterable: true,
//                 enabletooltips: true,
// 				showaggregates: true,
// 				showstatusbar: true,
                enablebrowserselection : true,
//                 selectionmode: 'checkbox',
                selectionmode: 'singlerow',
                columns: [
                  { text: '키', datafield: 'CHNO', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                  { text: '구분', datafield: 'GUBUN', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                  { text: '회원코드', datafield: 'CH_USER_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center',  hidden:true},
                  { text: '일자', datafield: 'IN_DATE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 120 ,editable : false},
                  { text: '헌금종류', datafield: 'GUBUN_NM', columntype: 'combobox', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '이름', datafield: 'CH_USER_NM', columntype: 'combobox', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '기타이름', datafield: 'USER_NAME', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 200 },
                  { text: '금액', datafield: 'MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: '150', cellsformat: 'd'},
                  { text: '비고', datafield: 'RMK', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 300 },
                  { text: '수정', cellsalign: 'center',align: 'center', width: 60, cellsrenderer : fnViewButton, editable : false},
                ]
            });
            $('#offer_grid').on('rowclick', function (event) 
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
          
        
		function searchOffer(){

			//합계
			searchOfferSum();
			
			var url = "/offertory/offerUserList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				data : {
					sch_userCode : $("#sh_userCode").val(),
					sch_userNm : $("#sh_userNm").val(),
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
			
			$("#offer_grid").jqxGrid({
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
					srch_appr_yn : 'N',
					},    
		  	    dataType : 'json',
		  	  	
		  	    success: function (data, status, xhr) {
// 		  	    	$("#summaryList").html()
					var totalSum = 0;
					var viewSum ="";
					var sumdata = data.data;
					if(sumdata.length > 0 ){
						for(var i = 0 ; i < sumdata.length ; i++){
							totalSum = totalSum + sumdata[i].SUM_MONEY;
							viewSum = viewSum  + sumdata[i].GUBUN_NM + "  :  " + fnAddComma(sumdata[i].SUM_MONEY) + "  &nbsp; |  &nbsp;  ";
						}
						viewSum = viewSum + " 전체금액   :   " +  fnAddComma(totalSum)	;
						
					} 

					$("#summaryList").html(viewSum)
					
		  		},
		  	    error: function (data, status, err) {
		  	    	alert("서머리 조회 오류!");
		  	    },
		  	    complete: function () {
	  	    	}
	  		});
        	
        }

        
		
		function addOfferDt(){
			
			if($("#offer_date").val() == "" ){
        		alert("날짜 입력은 필수 입니다.");
        		return false;
        	}
			if($("#offer_type").val() == "" ){
				alert("헌금 입력은 필수 입니다.");
				return false;
			}
			if($("#offer_amount").val() == "" ){
				alert("금액 입력은 필수 입니다.");
				return false;
			}
			if($("#offer_name").val() == "" ){
				alert("성명 입력은 필수 입니다.");
				return false;
			}
			console.log("ch_no:", $("#ch_no").val());
			if($("#ch_no").val() !== "" && $("#ch_no").val() !== null){
				$("#mode").val("UPDATE");
			}
			else
				$("#mode").val("INSERT");
			
			var frm = $("#formOffer");
  	    	var informData = frm.serialize();
  	    	
        	$.ajax({
		  	    url: '/offertory/saveOfferInfo.do',
		  	    method: 'post',
		  	    data: informData,	  	    
		  	    dataType : 'json',
		  	  success: function (data, status, xhr) {
		  	    alert("정상 처리 되었습니다.");
		  	    $("#offer_id").jqxComboBox('unselectItem',  $("#offer_id").val() );
		  	  	$("#offer_name").val("");
		  	 	$("#offer_name2").val("");
		  		$("#offer_amount").val("");
// 		  		$("#offer_note").val("");
		  	    $("#deleteBtn").hide();
		  	  	$("#mode").val("INSERT");  
	            $("#ch_no").val(""); 
	            
	            $("#offer_id").focus();
	            
		  	    searchOffer();
		  	},
		  	    error: function (data, status, err) {
		  	    	alert("저장시 오류가 발생되었습니다!");
		  	    },
		  	    complete: function () {

		  	    }
		  	});
        	

        	
        }

		function deleteOffer() {
		    if (!confirm("정말로 삭제하시겠습니까?")) return;

		    const ch_no = $("#ch_no").val();
		    if (!ch_no) {
		        alert("삭제할 항목이 없습니다.");
		        return;
		    }
		    
		    $("#mode").val("DELETE");
		    
		    var frm = $("#formOffer");
  	    	var informData = frm.serialize();

		    $.ajax({
		        url: '/offertory/saveOfferInfo.do',
		        method: 'post',
		        data: informData,
		        dataType: 'json',
		        success: function () {
		            alert("삭제되었습니다.");
		            var inDate =$("#offer_date").val();
		            $("#offer_id").jqxComboBox('unselectItem',  $("#offer_id").val() );
		            $("#offer_name").val("");
			  	    $("#formOffer")[0].reset();
		            $("#deleteBtn").hide();
		            $("#mode").val("INSERT");
		            $("#offer_date").val(inDate);
		            $("#ch_no").val(""); 
		            searchOffer();
		        },
		        error: function () {
		            alert("삭제 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		function fnOfferEditable(){
			var mstRow = $('#offer_grid').jqxGrid('getselectedrowindex');
        	var CHNO = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "CHNO");
        	var IN_DATE = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "IN_DATE");
        	var GUBUN = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "GUBUN");
        	var CH_USER_CODE = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "CH_USER_CODE");
        	var CH_USER_NM = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "CH_USER_NM");
        	var USER_NAME = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "USER_NAME");
        	var MONEY = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "MONEY");
        	var RMK = $('#offer_grid').jqxGrid('getcellvalue', mstRow, "RMK");
        	
        	$("#ch_no").val(CHNO);
        	$("#offer_date").val(IN_DATE);
        	$("#offer_type").val(GUBUN);
        	$("#offer_name").val(CH_USER_NM);
        	$("#offer_id").val(CH_USER_CODE);
        	$("#offer_name2").val(USER_NAME);
        	$("#offer_amount").val(MONEY);
        	$("#offer_note").val(RMK);
        	
        	$("#deleteBtn").show();
		}
		
		function apprval(){
		    if (!confirm("승인하시면 수정이 불가합니다. \n승인 하시겠습니까?")) return;

		    $("#mode").val("APPRAVOAL");
		    
		    var frm = $("#formOffer");
  	    	var informData = frm.serialize();

		    $.ajax({
		        url: '/offertory/saveOfferInfo.do',
		        method: 'post',
		        data: informData,
		        dataType: 'json',
		        success: function () {
		            alert("승인되었습니다.");
		            $("#offer_id").jqxComboBox('unselectItem',  $("#offer_id").val() );
		            $("#offer_name").val("");
			  	    $("#formOffer")[0].reset();
		            $("#deleteBtn").hide();
		            $("#mode").val("INSERT");    
		            $("#ch_no").val(""); 
		            
		            searchOffer();
		        },
		        error: function () {
		            alert("승인중 오류가 발생했습니다.");
		        }
		    });		
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
	                            <li class="breadcrumb-item active">헌금등록</li>
	                        </ol>
                        </div>
						<div >
                               <div class="card">
                                   <div class="card-header col-xl-12">
                                    	<div class="float-start col-xl-1-9">
		                                   	<form id="formOffer" name="formOffer">
		                                   	<input type="hidden" id="mode" name="mode">
		                                   	<input type="hidden" id="ch_no" name="ch_no">
								                <table clase="w-auto" style="width:1000px">
								                    <tr>
								                    	<td align="right" class="col-xl-1">
								                        	일자:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<div class="tbl-form-control w-50" id="offer_date" name="offer_date"></div>
								                        </td>
								                    	<td align="right" class="col-xl-1">
								                        	헌금종류:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<div class="tbl-form-control w-50 text-end"  id="offer_type" name="offer_type"></div>
								                        </td>
														<td align="right" class="col-xl-1">
								                        	비고:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<input class="tbl-form-control w-100"  id="offer_note" name="offer_note"/>
								                        </td>
								                    </tr>
								                    <tr>
								                    	<td align="right" class="col-xl-1">
								                        	이름:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<div class="tbl-form-control w-50" id="offer_id" name="offer_id"></div>
								                        	<input type="hidden" id="offer_name" name="offer_name">
								                        </td>
								                    	<td align="right" class="col-xl-1">
								                        	기타이름:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<input class="tbl-form-control w-100"  id="offer_name2" name="offer_name2"/>
								                        </td>
								                    	<td align="right" class="col-xl-1">
								                        	금액:
								                        </td>
								                        <td align="left" class="col-xl-3">
								                        	<input class="tbl-form-control w-50"  id="offer_amount" name="offer_amount" />
								                        </td>
								                    </tr>
								                </table>
							                </form>
                                        </div>
                                        <div class="float-end fcol-xl-3 align-bottom">
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addOfferDt()">저 장</a>
	                                         <a class="btn btn-outline-dark btn-sm" href="#" id="deleteBtn" onclick="deleteOffer()" style="display: none;">삭 제</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="apprval()">승 인</a>
                                        </div>
                                   </div>
                           		</div>
                            <div class="col-xl-12 mt-1">
                                <div class="card mb-3">
                                    <div class="card-body" id="summaryList">
									</div>
                                </div>
                            </div>
							<div id="offer_grid" class="my-1" ></div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>