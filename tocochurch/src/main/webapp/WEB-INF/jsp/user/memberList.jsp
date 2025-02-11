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
    var datafields = "";
    var menuCrtDatadaptor = "";
        $(document).ready(function () {

        	//메뉴권한
        	menuCrtDatadaptor = fnGridCodeList("CH009");
        	
        	datafields = [
                { name: 'USER_EMAIL', type: 'string' },
                { name: 'USER_NM', type: 'string' },
                { name: 'USER_PW', type: 'string' },
                { name: 'MOBILE', type: 'string' },
                { name: 'MENU_CTR', type: 'string' },
                { name: 'MENU_CTR_NM', type: 'string'},
                { name: 'LAST_LOGIN', type: 'string' },
                { name: 'PW_FAIL', type: 'string' },
                { name: 'CR_DT', type: 'string' },
                { name: 'CR_ID', type: 'string' },
                { name: 'UP_DT', type: 'string' },
                { name: 'UP_ID', type: 'string' },
            ];
        	
            setGrid();
			
			searchManager();
			
        });
        
        function setGrid(){
        	
            // initialize jqxGrid
            $("#grid").jqxGrid(
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
                  { text: '이메일', datafield: 'USER_EMAIL', cellsalign: 'left',align: 'center', width: 200, editable : false },
                  { text: '관리자명', datafield: 'USER_NM', cellsalign: 'center',align: 'center', width: 80},
                  { text: '비밀번호', datafield: 'USER_PW', cellsalign: 'center',align: 'center', width: 80 },
                  { text: '연락처', datafield: 'MOBILE', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '메뉴권한', datafield: 'MENU_CTR', cellsalign: 'center',align: 'center', width: 120, hidden :true },
                  { text: '메뉴권한', datafield: 'MENU_CTR_NM', columntype: 'dropdownlist', cellsalign: 'center',align: 'center', width: 200,
                      createeditor: function (row, value, editor) {
                          editor.jqxDropDownList({ source: menuCrtDatadaptor, checkboxes: true, displayMember: 'CODE_NM', valueMember: 'CODE' });
                      },
                      initEditor: function (row, cellvalue, editor, celltext, width, height) {
      					var row = $("#grid").jqxGrid("getrowdata",row);
      					
      	                var items = $(editor).jqxDropDownList('getItems');
      	                var ctrList = row.MENU_CTR;

      	                for(var i=0; i<items.length; i++) {
      	                    var index = items[i]['index'];

      	                    if(ctrList == undefined) {
      	                		$(editor).jqxDropDownList('uncheckIndex', index);
      						} else {
	      	                
      							var active = ctrList.indexOf(items[i].value);
	      	                    if (active == -1) {
	      	                    	$(editor).jqxDropDownList('uncheckIndex', index);
	      	                    } else {
	      	                    	$(editor).jqxDropDownList('checkIndex', index);
	      	                    }
	      	                    
      						}
      	                }
      				  },
                      getEditorValue: function (row, cellvalue, editor) {
      					//console.log($(editor).jqxDropDownList('getSelectedItem').label);
                         var items = $(editor).jqxDropDownList('getCheckedItems');
                         var checkedItems = "";
                         var checkedLabel = "";
                         $.each(items, function (index) {
                             checkedItems += this.value + ",";
                             checkedLabel += this.label + ",";
                         });
      					$("#grid").jqxGrid("setCellValue",row, "MENU_CTR",checkedItems);
      					return checkedLabel;
      				  }
                  },
                  { text: '마지막로그인', datafield: 'LAST_LOGIN', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '비밀번호오류', datafield: 'PW_PAIL', cellsalign: 'center',align: 'center', width: 120 },
                  { text: '수정자', datafield: 'UP_ID', cellsalign: 'center',align: 'center', width: 150, editable : false },
                  { text: '수정일', datafield: 'UP_DT', cellsalign: 'center',align: 'center', width: 100, editable : false },
                  { text: '등록자', datafield: 'CR_ID', cellsalign: 'center',align: 'center', width: 150, editable : false  },
                  { text: '등록일', datafield: 'CR_DT', cellsalign: 'center',align: 'center', width: 100, editable : false  },
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
       		    
       		    var crud = $('#grid').jqxGrid('getcellvalue', boundIndex, "CRUD");
      		  	if(crud == "C"){
      		  		$('#grid').jqxGrid('setcolumnproperty', 'USER_EMAIL', 'editable', true);
      		  	} else {
      		  		$('#grid').jqxGrid('setcolumnproperty', 'USER_EMAIL', 'editable', false);
      		  	}
       		}); 
            
            $("#grid").on('cellendedit', function (event) 
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
       		    
       		    var crud = $('#grid').jqxGrid('getcellvalue', rowBoundIndex, "CRUD");
      		  	if(crud != "C" && oldvalue != value){
					$("#grid").jqxGrid('setcellvalue', rowBoundIndex, "CRUD", "U");
      		  	}
       		    
       		});
        }
        
        function searchManager(){
			var url = "/member/selectManagerList";
			// prepare the data
			srchUserNm
			
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields,
				data : {
					srch_email : $("#srchEmail").val(),
					srch_userNm : $("#srchUserNm").val()
				},
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
			
			$("#grid").jqxGrid({
				source: dataAdapter
			});
			
        }
        
        function addManagerInfo(){
       		var row = {};
       		row["CRUD"]  = "C";
       		row["USER_MAIL"]  = "";
       		row["USER_NM"]  = "";
       		row["USER_PW"]  = "";
       		row["MOBILE"]  = "";
       		row["MENU_CTR"]  = "";
       		row["LAST_LOGIN"]  = "";
       		row["PW_FAIL"]  = "";
       		row["UP_DT"]  = "";
       		row["UP_ID"]  = "";
       		row["CR_DT"]  = "";
       		row["CR_ID"]  = "";
        	$("#grid").jqxGrid('addrow', 0, row, 'first');
        	
        	$("#grid").jqxGrid('endrowedit', null, false);
        	
        }
        
        function saveManagerInfo(){
        	
        	//컬럼정보
        	//cols.records.length --레코드 수량
        	//cols.records[0].datafield -- 첫번째 컬럼 아이디 
        	var cols = $('#grid').jqxGrid('columns');
        	
        	//그리드 전체중 신규와 수정만 찾아서json으로 만들어 저장
        	//전체 그리드 데이터 
        	var rows = $('#grid').jqxGrid('getrows');
        	var saveRows = new Array();
        	for(var i = 0 ; i < rows.length ; i++){
        		if(rows[i].CRUD != undefined){
        			
        			if(rows[i].USER_EMAIL == undefined || rows[i].USER_EMAIL == ""){
        				$("#grid").jqxGrid('showvalidationpopup', i , "USER_EMAIL", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].USER_NM == undefined || rows[i].USER_NM == ""){
        				$("#grid").jqxGrid('showvalidationpopup', i , "USER_NM", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].USER_PW == undefined || rows[i].USER_PW == ""){
        				$("#grid").jqxGrid('showvalidationpopup', i , "USER_PW", "필수값입니다. ");
        				return false;
        			}
        			
        			if(rows[i].MOBILE == undefined ) rows[i].MOBILE = "";
        			if(rows[i].MENU_CTR == undefined ) rows[i].MENU_CTR = "";
        			if(rows[i].LAST_LOGIN == undefined ) rows[i].LAST_LOGIN = "";
        			if(rows[i].PW_FAIL == undefined ) rows[i].PW_FAIL = "";
        			
        			saveRows.push(rows[i]);
        		}
        	}
        	
        	if(saveRows.lenght == 0 ){
        		alert("수정된 데이터가 없습니다. ");
        		return false;
        	}
        	
 		  	$.ajax({
		  	    url: '/member/saveManagerInfo',
		  	    method: 'post',
		  	    data: {
		  	    	saveRows : JSON.stringify(saveRows)
		  	    },		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {
		  	    	
		  	    	searchManager();
		        	
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("저장시 오류가 발생되었습니다!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	
        }
        
        
        function delManagerInfo(){
        	
            var dtlRow = $("#grid").jqxGrid('getselectedrowindex');
            var rowscount = $("#grid").jqxGrid('getdatainformation').rowscount;
        	var crud = $('#grid').jqxGrid('getcellvalue', dtlRow, "CRUD");
            
        	if(crud == "C"){
        		
	            if (dtlRow >= 0 && dtlRow < rowscount) {
	                var id = $("#grid").jqxGrid('getrowid', dtlRow);
	                var commit = $("#grid").jqxGrid('deleterow', id);
	            }
        	} else if(crud == "D"){
	            if (dtlRow >= 0 && dtlRow < rowscount) {
	        		$("#grid").jqxGrid('setcellvalue', dtlRow, "CRUD", "");
	            }
        	} else {
        		$("#grid").jqxGrid('setcellvalue', dtlRow, "CRUD", "D");
        	}
        	
        }
        
        
    </script>
                <main>
                    <div class="container-fluid px-3">
                    	<div>
                        <h4 class="mt-2">관리자 관리</h4>
                        </div>
                        <div>
	                        <ol class="breadcrumb mb-2">
	                            <li class="breadcrumb-item">시스템설정</li>
	                            <li class="breadcrumb-item active">관리자 관리</li>
	                        </ol>
                        </div>
						<div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start col-xl-9">
                                    		<div class="float-start  col-xl-1 text-xxl-end pt-xxl-1">
		                                        <label for="userEmail">이메일 :  </label>
                                    		</div>
                                    		<div class="float-start  col-xl-2 ps-xxl-1 ">
	                                        	<input class="form-control" id="srchEmail" name="srchEmail" type="email" placeholder="name@example.com" />
                                    		</div>
                                    		<div class="float-start  col-xl-1 text-xxl-end pt-xxl-1">
		                                        <label for="userEmail">관리자명 :  </label>
                                    		</div>
                                    		<div class="float-start  col-xl-2 ps-xxl-1 ">
	                                        	<input class="form-control" id="srchUserNm" name="srchUserNm" />
                                    		</div>
                                        </div>
                                    	<div class="float-end">
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchManager()">조회</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addManagerInfo()">추가</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="saveManagerInfo()">저장</a>
                                        <a class="btn btn-outline-dark btn-sm" href="#"  Onclick="delManagerInfo()">삭제</a>
                                        </div>
                                    </div>
                                </div>
								<div id="grid" class="my-1" ></div>
                            </div>
                        </div>	
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
