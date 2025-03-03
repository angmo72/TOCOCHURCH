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
    
    <script type="text/javascript" src="/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="/jqwidgets/jqxcalendar.js"></script>

    <script type="text/javascript">
    var datafields1 = "";
        $(document).ready(function () {
            
			//구분
			fnGetCodeList("srch_gubun", "CH007");
			//상태
			fnGetCodeList("srch_status", "CH008");
        	
            datafields1 = [
                { name: 'PRNO', type: 'string' },
                { name: 'USER_CODE', type: 'string' },
                { name: 'USER_NM', type: 'string' },
                { name: 'GUBUN', type: 'string' },
                { name: 'GUBUN_NM', type: 'string' },
                { name: 'STATUS', type: 'string' },
                { name: 'STATUS_NM', type: 'string' },
                { name: 'SUBJECT', type: 'string' },
                { name: 'SDATE', type: 'string' },
                { name: 'EDATE', type: 'string' },
                { name: 'DT_CNT', type: 'string' },
                { name: 'CR_DT', type: 'string' },
                { name: 'UP_DT', type: 'string' },
            ];
            
            setGrid();
			
			searchPrayList();
			
        });
        
        function setGrid(){
            
        	var fnViewButton = function(){
	            return '<button onClick="fnOpenPrayEdite()" class="btn btn-outline-dark btn-sm" style="margin:2px; width:50px; height:26px">보기</button>';
	        };
        	
            // initialize jqxGrid
            $("#grid1").jqxGrid(
            {
                width: "100%",
//                 source: dataAdapter,                
                pageable: true,
                autoheight: true,
                autoloadstate: true,
                sortable: true,
                altrows: true,
                enabletooltips: true,
                editable: false,
				filterable: true,
				selectionmode: 'singlerow',
                columns: [
                  { text: 'PRNO', datafield: 'PRNO', cellsalign: 'center',align: 'center', width: 100, hidden:true, editable : false },
                  { text: '이름', datafield: 'USER_CODE', cellsalign: 'center',align: 'center', width: 100, editable : false },
                  { text: '이름', datafield: 'USER_NM', cellsalign: 'center',align: 'center', width: 100, editable : false },
                  { text: '구분', datafield: 'GUBUN_NM', cellsalign: 'center',align: 'center', width: 100},
                  { text: '상태', datafield: 'STATUS_NM', cellsalign: 'center',align: 'center', width: 80 , editable : false},
                  { text: '제목', datafield: 'SUBJECT', cellsalign: 'left',align: 'center',},
                  { text: '시작일', datafield: 'SDATE', cellsalign: 'center',align: 'center', width: 90 },
                  { text: '종료일', datafield: 'EDATE', cellsalign: 'center',align: 'center', width: 90 },
                  { text: '진행수', datafield: 'DT_CNT', cellsalign: 'right',align: 'center', width: 80 },
                  { text: '보기', cellsalign: 'center',align: 'center', width: 60, cellsrenderer : fnViewButton, editable : false},
                ]
            }); 
        }
        
        function searchPrayList(){
			var url = "/user/selectPrayList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				data : {
                 		srch_gubun : $("#srch_gubun").val(),
                 		srch_status : $("#srch_status").val(),
                 		srch_user_nm : $("#srch_user_nm").val(),
                 		srch_subject : $("#srch_subject").val(),
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
        
        function fnOpenPrayEdite(){
        	var grideRow = $('#grid1').jqxGrid('getselectedrowindex');
        	var prno = $('#grid1').jqxGrid('getcellvalue', grideRow, "PRNO");
        	fnOpenPrayForm(prno);
        }
        
        function fnOpenPrayForm(prno){
        	
        	$("#srch_prno").val(prno);

        	$("#parySearchFrom").attr("action", "/user/userPrayForm.do");
    		$("#parySearchFrom").attr("method", "post");
        	$("#parySearchFrom").submit();
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
	                            <li class="breadcrumb-item active">중보기도 및 관리</li>
	                        </ol>
                        </div>
						<div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start col-xl-10">
							                <table clase="w-100">
							                    <tr>
							                    	<td align="right" class="col-xl-1">
							                            구분:
							                        </td>
							                        <td align="left" class="col-xl-1">
							                        	<div class="form-control w-100" id="srch_gubun" /></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                            상태:
							                        </td>
							                        <td align="left" class="col-xl-1">
							                        	<div class="form-control w-100" id="srch_status" /></div>
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	성명:
							                        </td>
							                        <td align="left" class="col-xl-2">
							                        	<input class="form-control w-100"  id="srch_user_nm" />
							                        </td>
							                    	<td align="right" class="col-xl-1">
							                        	제목:
							                        </td>
							                        <td align="left" class="col-xl-5">
							                        	<input class="form-control w-100"  id="srch_subject" />
							                        </td>
							                    </tr>
							                </table>
                                        </div>
                                    	<div class="float-end col-xl-2 text-xxl-end">
                                    		<a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchPray()">조회</a>
	                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="fnOpenPrayForm('')">추가</a>
                                        </div>
                                    </div>
                                    <div id="grid1" class="my-1" ></div>
                                </div>
                            </div>
                        </div>
    	        	</div>
    	        	<form id="parySearchFrom" name="parySearchFrom">
    	        		<input type="hidden" id="srch_prno" name="srch_prno">
    	        	</form>
    	        </main>
<%@include file="../include/footer.jsp" %>
