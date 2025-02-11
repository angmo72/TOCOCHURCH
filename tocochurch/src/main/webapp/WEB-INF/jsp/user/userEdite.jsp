<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    
    <script type="text/javascript" src="/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxgrid.sort.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.pager.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="/jqwidgets/jqxdropdownlist.js"></script>
    
    <script type="text/javascript" src="/jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcalendar.js"></script>

<!--     <script type="text/javascript" src="/jqwidgets/jqxmenu.js"></script> -->
    <script type="text/javascript" src="/jqwidgets/jqxgrid.edit.js"></script> 
<!--     <script type="text/javascript" src="/jqwidgets/jqxgrid.filter.js"></script>  -->
    
<!--     <script type="text/javascript" src="/jqwidgets/jqxnumberinput.js"></script> -->
<!--     <script type="text/javascript" src="/jqwidgets/jqxwindow.js"></script> -->
<!--     <script type="text/javascript" src="/jqwidgets/jqxinput.js"></script> -->

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
        $(document).ready(function () {
            datafields1 = [
                    { name: 'USER_CODE', type: 'string' },
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
            
            datafields2 = [
                { name: 'USER_CODE', type: 'string' },
                { name: 'USER_NM', type: 'string' },
                { name: 'GENDER', type: 'string' },
                { name: 'RELATIONSHIP', type: 'string' },
                { name: 'BIRTHDAY', type: 'string' },
                { name: 'MOBILE', type: 'string' },
                { name: 'EMAIL', type: 'string' },
                { name: 'BAPTISM', type: 'string' },
                { name: 'DUTY', type: 'string' }
            ];
            
            setGrid();
			
// 			getMstCode();

			//구역
			fnGetCodeList("frm_zone", "CH002");
			//신급
			fnGetCodeList("frm_baptism", "CH003");
			//직분
			fnGetCodeList("frm_duty", "CH004");
			
			//생년월일
			fnSetCalendar("frm_birthday", "", "", "");
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
                editable: true,
// 				filterable: true,
//                 enabletooltips: true,
                enablebrowserselection : true,
//                 selectionmode: 'checkbox',
                selectionmode: 'singlerow',
                columns: [
                  { text: '상태', datafield: 'CRUD', cellsalign: 'center',align: 'center', width: 50 , editable : false},
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
            
	            //가족관계
	            $("#grid2").jqxGrid(
                    {
                        width: "100%",
                        pageable: true,
                        autoheight: true,
                        autorowheight: true,
//                         sortable: true,
                        altrows: true,
//                         enabletooltips: true,
                        editable: true,
//         				filterable: true,
//                         enabletooltips: true,
                        enablebrowserselection : true,
//                         selectionmode: 'checkbox',
                        selectionmode: 'singlerow',
                        columns: [
                          { text: '상태', datafield: 'CRUD', cellsalign: 'center',align: 'center', width: 50 , editable : false},
                          { text: '코드', datafield: 'US_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false},
                          { text: '성명', datafield: 'USER_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 },
                          { text: '관계', datafield: 'RELATIONSHIP', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                          { text: '성별', datafield: 'GENDER', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                          { text: '생년월일', datafield: 'BIRTHDAY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 },
                          { text: '신급', datafield: 'BAPTISM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                          { text: '직분', datafield: 'DUTY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                          { text: '비고', datafield: 'RMK', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 170 },
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
                 		    
                 		    var grpCode = $('#grid1').jqxGrid('getcellvalue', boundIndex, "GRP_CODE");
        					if(grpCode != ''){
        						getDtlCodeList(grpCode);
        					}
                 		}); 
        }
        
        function searchUser(){
			var url = "/user/selectUserList";
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
	                            <li class="breadcrumb-item active">교인조회/등록</li>
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
								                        	<input class="tbl-form-control w-100" id="sh_userCode" />
								                        </td>
								                    	<td align="right" class="col-xl-2">
								                        	성명:
								                        </td>
								                        <td align="left" class="col-xl-4">
								                        	<input class="tbl-form-control w-100"  id="sh_userNm" />
								                        </td>
								                    </tr>
								                </table>
	                                        </div>
                                        </div>
                                        <div class="fcol-xl-3">
	                                        <div class="float-end align-middle">
		                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchUser()">조회</a>
		                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addCodeDt()">추가</a>
		                                        <a class="btn btn-outline-dark btn-sm" href="#"  Onclick="delCodeDt()">삭제</a>
	                                        </div>
	                                    </div>
                                    </div>
	                            </div>
								<div id="grid1" class="my-1" ></div>
                            </div>
                            <div class="col-xl-7">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        상세정보
                                        </div>
                                    	<div class="float-end">
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="saveCodeDt()">저장</a>
                                        </div>
                                    </div>
                                </div>
								<div class="card-header-tabs my-1 p-2 " >
					                <table clase="w-100 ">
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 코드: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-50" id="frm_US_CODE" /></td>
					                    	<td align="right" class="col-xl-4" colspan=2> </td>
					                    	<td align="right" class="col-xl-1"> 구역: </td>
					                        <td align="left" class="col-xl-3"> <div class="tbl-form-control w-75"  id="frm_zone" ></div></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이름: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="frm_USER_NM" /> </td>
					                    	<td align="right" class="col-xl-1"> 성별: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-30"  id="sch_userNm" /> </td>
					                    	<td align="right" class="col-xl-1"> 생년월일: </td> 
					                        <td align="left" class="col-xl-3"> <div class="tbl-form-control w-75"  id="frm_birthday"></div></td>
					                    </tr>
					                    <tr>
											<td align="right" class="col-xl-1"> 휴대폰: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="sch_userCode" /> </td>
					                    	<td align="right" class="col-xl-1"> 신급: </td>
					                        <td align="left" class="col-xl-3">  <div class="tbl-form-control w-75"  id="frm_baptism" ></div> </td>
					                    	<td align="right" class="col-xl-1"> 직분: </td>
					                        <td align="left" class="col-xl-3">  <div class="tbl-form-control w-75"  id="frm_duty" ></div> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이메일: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100"  id="sch_userNm" /> </td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td> 
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-75"  id="sch_userNm" /></td>
					                    	<td align="right" class="col-xl-1"> 인도자: </td> 
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-75"  id="sch_userNm" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 주소: </td>
					                        <td align="left" class="col-xl-11" colspan=5>
					                        	<div class="float-start col-xl-2 mx-1">
					                        		<input class="tbl-form-control w-100" id="sch_userCode" />
					                        	</div>
					                        	<div class="float-end col-xl-9 mx-1">
					                        		<input class="tbl-form-control w-100"  id="sch_userNm" />
					                        	</div>
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 회사: </td>
					                        <td align="left" class="col-xl-11" colspan=5>
					                        	<div class="float-start col-xl-2 mx-1">
					                        		<input class="tbl-form-control w-100" id="sch_userCode" />
					                        	</div>
					                        	<div class="float-end col-xl-9 mx-1">
					                        		<input class="tbl-form-control w-100"  id="sch_userNm" />
					                        	</div>
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 회사전화: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-50"  id="sch_userNm" /> </td>
					                    	<td align="right" class="col-xl-1"> 직장: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-50" id="sch_userCode" /> </td>
					                    	<td align="right" class="col-xl-1"> 직위: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-50"  id="sch_userNm" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 비고: </td>
					                        <td align="left" class="col-xl-11" colspan=5> <textarea rows="3" class="tbl-form-control w-100"  id="sch_userNm"></textarea></td>
					                    </tr>
					                </table>
								
								</div>
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        가족관계
                                        </div>
                                    	<div class="float-end">
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addCodeDt()">추가</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="saveCodeDt()">저장</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#"  Onclick="delCodeDt()">삭제</a>
                                        </div>
                                    </div>
                                </div>
                                <div id="grid2" class="my-1" ></div>
								
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
