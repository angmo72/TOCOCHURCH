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

    <script type="text/javascript" src="/jqwidgets/jqxdata.export.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.export.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxexport.js"></script>
    
    <script type="text/javascript" src="/js/jqw/scripts/jszip.min.js"></script>

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
        $(document).ready(function () {

    		var today = new Date();
    		var frmDay = fnAddDay(today, -30);
    		fnSetCalendar("srch_financeDateFrom", "yyyy-MM-dd");
    		$('#srch_financeDateFrom').jqxDateTimeInput('setDate', frmDay);
    		
    		fnSetCalendar("srch_financeDateTo", "yyyy-MM-dd");
        	
			dsGubunCode = fnGridCodeList("CH012");
			dsInCategoryCode = fnGridCodeList("CH005");
    		
			fnSetCodeDiv("srch_gubun", dsGubunCode, "전체");
			fnSetCodeDiv("srch_category", "");
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
                { name: 'OFFERTORY_DATE', type: 'string' },
                { name: 'CR_ID', type: 'string' },
                { name: 'CR_DT', type: 'string' },
                { name: 'UP_ID', type: 'string' },
                { name: 'UP_DT', type: 'string' },
                ];
            setGrid();
			
        });
        
        function setGrid(){
            $("#financeGrid").jqxGrid(
            {
                width: "100%",
                autoheight: true,
                altrows: true,
                editable: false,
                enablebrowserselection : true,
				showaggregates: true,
			    showstatusbar: true,
                selectionmode: 'singlerow',
                columns: [
                  { text: 'FNNO', datafield: 'FNNO', cellsalign: 'center',align: 'center', width: 80, hidden:true},
                  { text: '일자', datafield: 'FNDATE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 100 ,editable : false},
                  { text: '수입/지출', datafield: 'GUBUN', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80, hidden:true},
                  { text: '수입/지출', datafield: 'GUBUN_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80},
                  { text: '항목', datafield: 'CATEGORY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 150 , hidden:true},
                  { text: '항목', datafield: 'CATEGORY_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 150 },
                  { text: '세부내역', datafield: 'SUB_MEMO', columntype: 'textbox', cellsalign: 'left',align: 'center', width: 200 },
                  { text: '수입', datafield: 'IN_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 130, cellsformat: 'd' 
                      ,aggregates: [{
                          '계': function (aggregatedValue, currentValue) {
                              if (currentValue) {
                                  return aggregatedValue + currentValue;
                              }
                              return aggregatedValue;
                          }
                      }]
                  },
                  { text: '지출', datafield: 'OUT_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 130, cellsformat: 'd' 
                      ,aggregates: [{
                          '계': function (aggregatedValue, currentValue) {
                              if (currentValue) {
                                  return aggregatedValue + currentValue;
                              }
                              return aggregatedValue;
                          }
                      }]
                  },
                  { text: '잔액', datafield: 'REST_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 130, cellsformat: 'd'},
                  { text: '비고', datafield: 'MEMO', columntype: 'textbox', cellsalign: 'center',align: 'center'},
                  { text: 'OFFERTORY_DATE', datafield: 'OFFERTORY_DATE', cellsalign: 'center',align: 'center', width: 60, hidden:true, editable : false},
                ]
            });
            $('#financeGrid').on('rowclick', function (event) 
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
        
        function searchFinance(){
			var url = "/finance/searchMngFinanceList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields1,
				data : {
					srch_financeDateFrom : $("#srch_financeDateFrom").val(),
					srch_financeDateTo : $("#srch_financeDateTo").val(),
					srch_gubun : $("#srch_gubun").val(),
					srch_category : $("#srch_category").val(),
					srch_subMemo : $("#srch_subMemo").val()
					},
				id: 'id',
				url: url
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
			    downloadComplete: function (data, status, xhr) { },
			    loadComplete: function (data) { },
			    loadError: function (xhr, status, error) { }
			});
			
			$("#financeGrid").jqxGrid({
				source: dataAdapter
			});
        }
        
        function excelDownload(){
        	$("#financeGrid").jqxGrid('exportdata', 'xlsx', '함께가는교회 재정현황', true, null, true);
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
                               <div class="card">
                                   <div class="card-header col-xl-12">
                                    	<div class="float-start col-xl-1-9">
							                <table clase="w-auto" style="width:1000px">
							                    <tr>
							                    	<td align="right" class="col-xl-1">
							                        	시작일자:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-70" id="srch_financeDateFrom" name="srch_financeDateFrom"></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	종료일자:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-70" id="srch_financeDateTo" name="srch_financeDateTo"></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	세부내역:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-100"  id="srch_subMemo"  id="srch_subMemo"/>
							                        </td>
							                    </tr>
							                    <tr>
							                        <td align="right" class="col-xl-1">
							                        	수입/지출:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-70" id="srch_gubun" name="srch_gubun" /></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	항목:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<div class="tbl-form-control w-70"  id="srch_category" name="srch_category"/></div>
							                        </td>
							                    </tr>
							                </table>
                                        </div>
                                        <div class="float-end fcol-xl-3 align-bottom">
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchFinance()">조 회</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="excelDownload()">엑셀저정</a>
                                        </div>
                                   </div>
                           		</div>
							<div id="financeGrid" class="my-1" ></div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
