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
            
            setGrid();
			
// 			getMstCode();
			
        });
        
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
                  { text: '일자', datafield: 'IN_DATE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 120 ,editable : false},
                  { text: '수입/지출', datafield: 'GUBUN', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 },
                  { text: '항목', datafield: 'CATEGORY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 150 },
                  { text: '세무내역', datafield: 'CATEGORY2', columntype: 'textbox', cellsalign: 'left',align: 'center', width: 200 },
                  { text: '수입', datafield: 'IN_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 150 },
                  { text: '지출', datafield: 'OUT_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 150 },
                  { text: '잔액', datafield: 'REST_MONEY', columntype: 'textbox', cellsalign: 'right',align: 'center', width: 150 },
                  { text: '비고', datafield: 'RMK', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 },
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
        }
        
        function getMstCode(){
			var url = "/sysCode/getMstCodeList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields1,
				id: 'id',
				url: url,
				pagesize :15
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
							                        	년월:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-50" id="sch_userCode" />
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	수입/지출:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-50" id="sch_userCode" />
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	항목:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-50"  id="sch_userNm" />
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	세무내역:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="tbl-form-control w-100"  id="sch_userNm" />
							                        </td>
							                    </tr>
							                </table>
                                        </div>
                                        <div class="float-end fcol-xl-3 align-bottom">
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchUser()">조 회</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchUser()">다운로드</a>
                                        </div>
                                   </div>
                           		</div>
							<div id="grid1" class="my-1" ></div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
