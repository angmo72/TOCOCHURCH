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
                    { name: 'GRP_CODE', type: 'string' },
                    { name: 'CODE_NM', type: 'string' },
                    { name: 'RMK', type: 'string' }
                ];
            
            datafields2 = [
                { name: 'GRP_CODE', type: 'string' },
                { name: 'CODE', type: 'string' },
                { name: 'CODE_NM', type: 'string' },
                { name: 'RMK', type: 'string' },
                { name: 'REF', type: 'string' },
                { name: 'REF1', type: 'string' },
                { name: 'REF2', type: 'string' },
                { name: 'ORD', type: 'number' }
            ];

            
            $("#grd1Popup").jqxWindow({
                width: 350, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#mt_Cancel"), modalOpacity: 0.01           
            });
            $("#grd1Popup").on('open', function () {
                $("#fm_GRP_CODE").jqxInput('selectAll');
            });
         
            $("#mt_Cancel").jqxButton();
            $("#mt_Save").jqxButton();
            // update the edited row when the user clicks the 'Save' button.
            $("#mt_Save").click(function () {
                mstSave();
                $("#grd1Popup").jqxWindow('hide');
            });
            
            setGrid();
			
			getMstCode();
			
        });
        
        function setGrid(){
            $("#grid1").jqxGrid(
            {
                width: "100%",
                pageable: true,
                pagesize: 15,
                pagermode: 'simple',
                autoheight: true,
                sortable: true,
                altrows: true,
//                 enabletooltips: true,
                editable: false,
// 				filterable: true,
//                 enabletooltips: true,
                enablebrowserselection : true,
//                 selectionmode: 'checkbox',
                selectionmode: 'singlerow',
                columns: [
                  { text: '그룹코드', datafield: 'GRP_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false},
                  { text: '코드명', datafield: 'CODE_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 110 },
                  { text: '설명', datafield: 'RMK', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 200 },
                  { text: '수정', datafield: 'Edit', columntype: 'button', cellsalign: 'center',align: 'center',  width: 60 ,cellsrenderer: function () {
                      return "수정";
                   }, buttonclick: function (row) {
                      // open the popup window when the user clicks a button.
                      editrow = row;
                      var offset = $("#grid1").offset();
                      $("#grd1Popup").jqxWindow({ position: { x: parseInt(offset.left) + 20, y: parseInt(offset.top) + 20 } });
                      // get the clicked row's data and initialize the input fields.
                      var dataRecord = $("#grid1").jqxGrid('getrowdata', editrow);
                      $("#fm_GRP_CODE").val(dataRecord.GRP_CODE);
                      $("#fm_GRP_CODE").prop("readonly",true);
                      $("#fm_CODE_NM").val(dataRecord.CODE_NM);
                      $("#fm_RMK").val(dataRecord.RMK);
                      $("#fm_MODE").val("UPDATE");
                      // show the popup window.
                      $("#grd1Popup").jqxWindow('open');
                  }
                  }
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
                pagesize: 15,
                pagermode: 'simple',
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
                  { text: '그룹코드', datafield: 'GRP_CODE', cellsalign: 'center',align: 'center', width: 80, editable : false },
                  { text: '코드', datafield: 'CODE', cellsalign: 'center',align: 'center', width: 80},
                  { text: '코드명', datafield: 'CODE_NM', cellsalign: 'center',align: 'center', width: 150 },
                  { text: '설명', datafield: 'RMK', cellsalign: 'left',align: 'center', width: 300 },
                  { text: '참조', datafield: 'REF', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '참조1', datafield: 'REF1', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '참조1', datafield: 'REF2', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '정렬', datafield: 'ORD', cellsalign: 'center',align: 'center', width: 80 }
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
			var url = "/sysCode/getMstCodeList.do";
			// prepare the data
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields1,
				id: 'id',
				url: url,
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
        
        //row 추가 
        function addMstCode(){
            // open the popup window when the user clicks a button.
            var offset = $("#grid1").offset();
            $("#grd1Popup").jqxWindow({ position: { x: parseInt(offset.left) + 20, y: parseInt(offset.top) + 20 } });
            $("#fm_GRP_CODE").val("");
            $("#fm_GRP_CODE").prop("readonly",false);
            $("#fm_CODE_NM").val("");
            $("#fm_RMK").val("");
            // show the popup window.
			$("#fm_MODE").val("INSERT");
            $("#grd1Popup").jqxWindow('open');
        }
        
        //선태로 삭제
        function deleteMstCode(){
        	
        	var rowList = $('#grid1').jqxGrid('getselectedrowindexes');
        	
        	if(rowList.length == 0 ){
        		alert("선택된 데이터가 없습니다!");
        		return false;
        	}
        	
        	var grpCodeList = "";
        	for(var i = 0 ; i < rowList.length ; i++){
        		var cellValue = $('#grid1').jqxGrid('getcellvalue', rowList[i], "GRP_CODE");
        		if( i == 0) grpCodeList = cellValue + "";
        		else grpCodeList = grpCodeList +"," + cellValue;
        	}
        	
        	
        	var result = confirm("삭제 하시겠습니까?");
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/sysCode/saveMstCode.do',
			  	    method: 'post',
			  	    data: {
			  	        mode: 'DELETE',
			  	        grpCodeList: grpCodeList
			  	    },		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	getMstCode();
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("삭제에 실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        }
        
        function mstSave(){
	
        	if($("#fm_GRP_CODE").val() ==""){
        		alert("그룹코드를 등록해주세요!");
        		return false;
        	}
        	if($("#fm_CODE_NM").val() ==""){
        		alert("코드명을 입력해주세요!");
        		return false;
        	}
        		
  	        
 		  	$.ajax({
		  	    url: '/sysCode/saveMstCode.do',
		  	    method: 'post',
		  	    data: {
		  	        mode: $("#fm_MODE").val(),
		  	        grpCode: $("#fm_GRP_CODE").val(),
		  	        codeNm: $("#fm_CODE_NM").val(),
		  	        rmk: $("#fm_RMK").val()
		  	    },		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {
		  	    	getMstCode();
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("신규등록/업데이트에 실폐하였습니다.!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	
        }
        
        
        function getDtlCodeList(grpCode){
			
        	var url = "/sysCode/getDtlCodeList.do";
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields2,
				data : {grpCode : grpCode},
				id: 'id',
				url: url,
                addrow: function (rowid, rowdata, position, commit) {
                    // synchronize with the server - send insert command
                    // call commit with parameter true if the synchronization with the server is successful 
                    //and with parameter false if the synchronization failed.
                    commit(true);
                },
                deleterow: function (rowid, commit) {
                    // synchronize with the server - send delete command
                    // call commit with parameter true if the synchronization with the server is successful 
                    //and with parameter false if the synchronization failed.
                    commit(true);
                },
                updaterow: function (rowid, newdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    commit(true);
                }
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
			    downloadComplete: function (data, status, xhr) { },
			    loadComplete: function (data) { },
			    loadError: function (xhr, status, error) { }
			});
			
			$("#grid2").jqxGrid({
				source: dataAdapter
			});
			
        }
        
        function addCodeDt(){
        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
        	var cellValue = $('#grid1').jqxGrid('getcellvalue', mstRow, "GRP_CODE");
        	if(cellValue !=null && cellValue != ""){
        	
        		var row = {};
        		row["CRUD"]  = "C";
        		row["GRP_CODE"]  = cellValue;
        		row["CODE"]  = "";
        		row["CODE_NM"]  = "";
        		row["RMK"]  = "";
        		row["REF"]  = "";
        		row["REF1"]  = "";
        		row["REF2"]  = "";
	        	$("#grid2").jqxGrid('addrow', 0, row, 'first');
	        	
	        	$("#grid2").jqxGrid('endrowedit', null, false);
        	}
        	
        }
        
        function saveCodeDt(){
        	
        	//컬럼정보
        	//cols.records.length --레코드 수량
        	//cols.records[0].datafield -- 첫번째 컬럼 아이디 
        	var cols = $('#grid2').jqxGrid('columns');
        	
        	//그리드 전체중 신규와 수정만 찾아서json으로 만들어 저장
        	//전체 그리드 데이터 
        	var rows = $('#grid2').jqxGrid('getrows');
        	var saveRows = new Array();
        	for(var i = 0 ; i < rows.length ; i++){
        		if(rows[i].CRUD != undefined){
        			
        			if(rows[i].GRP_CODE == undefined || rows[i].GRP_CODE == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "GRP_CODE", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].CODE == undefined || rows[i].CODE == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "CODE", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].CODE_NM == undefined || rows[i].CODE_NM == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "CODE_NM", "필수값입니다. ");
        				return false;
        			}
        			
        			if(rows[i].RMK == undefined ) rows[i].RMK = "";
        			if(rows[i].REF == undefined ) rows[i].REF = "";
        			if(rows[i].REF1 == undefined ) rows[i].REF1 = "";
        			if(rows[i].REF2 == undefined ) rows[i].REF2 = "";
        			if(rows[i].ORD == undefined ) rows[i].ORD = 0;
        			
        			saveRows.push(rows[i]);
        		}
        	}
        	
        	if(saveRows.lenght == 0 ){
        		alert("수정된 데이터가 없습니다. ");
        		return false;
        	}
        	
 		  	$.ajax({
		  	    url: '/sysCode/saveDtlCode',
		  	    method: 'post',
		  	    data: {
		  	    	saveRows : JSON.stringify(saveRows)
		  	    },		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {
		  	    	
		        	
		        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
		        	var grpCode = $('#grid1').jqxGrid('getcellvalue', mstRow, "GRP_CODE");
		        	getDtlCodeList(grpCode);
		        	
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("저장시 오류가 발생되었습니다!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	
        }
        
        
        function delCodeDt(){
        	
            var dtlRow = $("#grid2").jqxGrid('getselectedrowindex');
            var rowscount = $("#grid2").jqxGrid('getdatainformation').rowscount;
        	var crud = $('#grid2').jqxGrid('getcellvalue', dtlRow, "CRUD");
            
        	if(crud == "C"){
        		
	            if (dtlRow >= 0 && dtlRow < rowscount) {
	                var id = $("#grid2").jqxGrid('getrowid', dtlRow);
	                var commit = $("#grid2").jqxGrid('deleterow', id);
	            }
        	} else if(crud == "D"){
	            if (dtlRow >= 0 && dtlRow < rowscount) {
	        		$("#grid2").jqxGrid('setcellvalue', dtlRow, "CRUD", "");
	            }
        	} else {
        		$("#grid2").jqxGrid('setcellvalue', dtlRow, "CRUD", "D");
        	}
        	
        }
        
        
    </script>
                <main>
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">기준정보 관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">시스템설정</li>
	                            <li class="breadcrumb-item active">기준정보 관리</li>
	                        </ol>
                        </div>
						<div class="row">
                            <div class="col-xl-4">
                                <div class="card mb-０">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        기준정보
                                        </div>
                                        <div class="float-end">
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addMstCode()">추가</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="deleteMstCode()">삭제</a>
                                        </div>
                                    </div>
	                            </div>
								<div id="grid1" class="my-1" ></div>
								<div id="grd1Popup">
						            <div>기준정보</div>
						            <div style="overflow: hidden;" class="px-3 pt-3 pb-4">
						                <table clase="vw-100">
						                    <tr>
						                        <td align="right" clase="vw-100">그룹코드:</td>
						                        <td align="left">
						                        	<input type="hidden" id="fm_MODE">
						                        	<input class="form-control w-50" id="fm_GRP_CODE" />
						                        </td>
						                    </tr>
						                    <tr>
						                        <td align="right">코드명:</td>
						                        <td align="left"><input class="form-control w-50"  id="fm_CODE_NM" /></td>
						                    </tr>
						                    <tr>
						                        <td align="right">설명:</td>
						                        <td align="left"><input class="form-control"  id="fm_RMK" /></td>
						                    </tr>
						                    <tr>
						                        <td align="right"></td>
						                        <td style="padding-top: 10px;" align="right">
						                        	<input style="margin-right: 5px;" type="button" id="mt_Save" value="Save" />
						                        	<input id="mt_Cancel" type="button" value="Cancel" />
						                        </td>
						                    </tr>
						                </table>
						            </div>
						       </div>
                            </div>
                            <div class="col-xl-8">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        상세정보
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
