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

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
        $(document).ready(function () {
            datafields1 = [
                    { name: 'US_CODE', type: 'string' },
                    { name: 'USER_NM', type: 'string' },
                    { name: 'GENDER', type: 'string' },
                    { name: 'ZONE', type: 'string' },
                    { name: 'BIRTHDAY', type: 'string' },
                    { name: 'MOBILE', type: 'string' },
                    { name: 'EMAIL', type: 'string' },
                    { name: 'BAPTISM', type: 'string' },
                    { name: 'DUTY', type: 'string' },
                    { name: 'GUIDE', type: 'string' },
                ];
            
            datafields1 = [
                { name: 'US_CODE', type: 'string' },
                { name: 'GUBUN', type: 'string' },
                { name: 'RMK', type: 'string' },
                { name: 'STATUS', type: 'string' },
                { name: 'CR_DT', type: 'string' },
                { name: 'UP_DT', type: 'string' },
            ];
            
            setGrid();
			
// 			getMstCode();
			
        });
        
        function setGrid(){
            $("#grid1").jqxGrid(
            {
                width: "100%",
                pageable: true,
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
                  { text: '코드', datafield: 'US_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false},
                  { text: '성명', datafield: 'USER_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 110 },
                  { text: '성별', datafield: 'GENDER', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 50 },
                  { text: '휴대폰', datafield: 'MOBILE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '신급', datafield: 'BAPTISM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '직분', datafield: 'DUTY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '인도자', datafield: 'GUIDE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 110 },
                  { text: '구역', datafield: 'ZONE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 },
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
         		    
         		    var grpCode = $('#grid1').jqxGrid('getcellvalue', boundIndex, "GRP_CODE");
					if(grpCode != ''){
// 						$("#grid1").jqxGrid('selectrow', boundIndex);
						getDtlCodeList(grpCode);
					}
         		}); 
            
            
            // initialize jqxGrid
            $("#grid2").jqxGrid(
            {
                width: "100%",
//                 source: dataAdapter,                
                pageable: true,
                autoheight: true,
                autoloadstate: true,
                sortable: true,
                altrows: true,
                enabletooltips: true,
                editable: true,
				filterable: true,
				selectionmode: 'singlerow',
                columns: [
                  { text: '상태', datafield: 'CRUD', cellsalign: 'center',align: 'center', width: 50 , editable : false},
                  { text: '유저코드', datafield: 'GRP_CODE', cellsalign: 'center',align: 'center', width: 80, editable : false },
                  { text: '구분', datafield: 'CODE', cellsalign: 'center',align: 'center', width: 50},
                  { text: '메모내용', datafield: 'CODE_NM', cellsalign: 'center',align: 'center', width: 500 },
                  { text: '상태', datafield: 'RMK', cellsalign: 'left',align: 'center', width: 50 },
                  { text: '등록일', datafield: 'REF', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '수정일', datafield: 'REF1', cellsalign: 'center',align: 'center', width: 80 },
                ]
            }); 
            $('#grid2').on('rowclick', function (event) 
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
       		    
       		    var crud = $('#grid2').jqxGrid('getcellvalue', boundIndex, "CRUD");
      		  	if(crud == "C"){
      		  		$('#grid2').jqxGrid('setcolumnproperty', 'CODE', 'editable', true);
      		  	} else {
      		  		$('#grid2').jqxGrid('setcolumnproperty', 'CODE', 'editable', false);
      		  	}
       		}); 
            
            $("#grid2").on('cellendedit', function (event) 
       		{
       		    // event arguments.
       		    var args = event.args;
       		    // column data field.
       		    var dataField = event.args.datafield;
       		    // row's bound index.
       		    var rowBoundIndex = event.args.rowindex;
       		    // cell value
       		    var value = args.value;
       		    // cell old value.
       		    var oldvalue = args.oldvalue;
       		    // row's data.
       		    var rowData = args.row;
       		    
       		    if(oldvalue == undefined) oldvalue="";
       		    
       		    var crud = $('#grid2').jqxGrid('getcellvalue', rowBoundIndex, "CRUD");
      		  	if(crud != "C" && oldvalue != value){
					$("#grid2").jqxGrid('setcellvalue', rowBoundIndex, "CRUD", "U");
      		  	}
       		    
       		});
        }
        
        function getMstCode(){
			var url = "/sysCode/getMstCodeList";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields1,
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
        
        
    </script>
                <main>
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">교인관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">교인관리</li>
	                            <li class="breadcrumb-item active">교인관리</li>
	                        </ol>
                        </div>
						<div class="row">
                            <div class="col-xl-5">
                                <div class="card mb-０">
                                    <div class="card-header">
                                    	<div class="col-xl-9">
	                                    	<div class="float-start">
								                <table clase="w-100">
								                    <tr>
								                    	<td align="right" class="col-xl-2">
								                        	코드:
								                        </td>
								                        <td align="left" class="col-xl-4">
								                        	<input class="form-control w-100" id="sch_userCode" />
								                        </td>
								                    	<td align="right" class="col-xl-2">
								                        	성명:
								                        </td>
								                        <td align="left" class="col-xl-4">
								                        	<input class="form-control w-100"  id="sch_userNm" />
								                        </td>
								                    </tr>
								                </table>
	                                        </div>
                                        </div>
                                        <div class="fcol-xl-3">
	                                        <div class="float-end align-middle">
		                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchUser()">조회</a>
	                                        </div>
	                                    </div>
                                    </div>
	                            </div>
								<div id="grid1" class="my-1" ></div>
								
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        홍길동 상세정보
                                        </div>
                                    </div>
                                </div>
								<div class="card-header-tabs my-1 p-2 " >
					                <table clase="w-100 ">
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 코드: </td>
					                        <td align="left" class="col-xl-1" ><input class="tbl-form-control w-20" id="sch_userCode" /></td>
					                    	<td align="right" class="col-xl-1"> 구역: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100"  id="sch_userNm" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이름: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="sch_userCode" /> </td>
					                    	<td align="right" class="col-xl-1"> 성별: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-20"  id="sch_userNm" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 생년월일: </td> 
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100"  id="sch_userNm" /></td>
					                    	<td align="right" class="col-xl-1"> 휴대폰: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="sch_userCode" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이메일: </td>
					                        <td align="left" class="col-xl-3" colspan=3> <input class="tbl-form-control w-100"  id="sch_userNm" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 비고: </td>
					                        <td align="left" class="col-xl-3" colspan=3> <textarea rows="3" class="tbl-form-control w-100"  id="sch_userNm"></textarea></td>
					                    </tr>
					                </table>
								
								</div>
								
                            </div>
                            <div class="col-xl-7">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        	기도 및 관리사항
                                        </div>
                                    	<div class="float-end">
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addCodeDt()">추가</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="saveCodeDt()">저장</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#"  Onclick="delCodeDt()">삭제</a>
                                        </div>
                                    </div>
                                    <div id="grid2" class="my-1" ></div>
                                </div>
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
