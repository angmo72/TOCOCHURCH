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

    <script type="text/javascript" src="/jqwidgets/jqxgrid.edit.js"></script> 
    
    <script type="text/javascript" src="/jqwidgets/jqxwindow.js"></script>

    <script type="text/javascript">
    var datafields1 = "";
    var datafields2 = "";
    var dsZoneCode = "";
    var dsGenderCode = "";
    var dsBaptismCode = "";
    var dsDutyCode = "";
        $(document).ready(function () {
        	
			//구역
// 			fnGridCodeList("frm_zone", "CH002");
			dsZoneCode = fnGridCodeList("CH002");
			fnSetCodeDiv("frm_zone", dsZoneCode);
// 			fnSetCodeDiv("frm_zone");
			
			//부서
			fnGetCodeList("frm_dept", "CH011");
			//신급
			fnGetCodeList("frm_baptism", "CH003");
			//직분
			fnGetCodeList("frm_duty", "CH004");
			
			//성별
			dsGenderCode = fnGridCodeList("CH010");
			fnSetCodeDiv("frm_gender", dsGenderCode);
			
			//생년월일
			fnSetCalendar("frm_birthday", "yyyy-MM-dd");
			$('#frm_birthday').val("");
        	
            datafields1 = [
                    { name: 'USER_CODE', type: 'string' },
                    { name: 'USER_NM', type: 'string' },
                    { name: 'GENDER', type: 'string' },
                    { name: 'ZONE', type: 'string' },
                    { name: 'DEPT', type: 'string' },
                    { name: 'BIRTHDAY', type: 'string' },
                    { name: 'MOBILE', type: 'string' },
                    { name: 'EMAIL', type: 'string' },
                    { name: 'BAPTISM', type: 'string' },
                    { name: 'DUTY', type: 'string' },
                    { name: 'GUIDE', type: 'string' },
                ];
            
            datafields2 = [
                { name: 'FAMILY_CODE', type: 'string' },
                { name: 'USER_CODE', type: 'string' },
                { name: 'USER_NM', type: 'string' },
                { name: 'GENDER', type: 'string' },
                { name: 'RELATION', type: 'string' },
                { name: 'BIRTHDAY', type: 'string' },
                { name: 'MOBILE', type: 'string' },
                { name: 'BAPTISM', type: 'string' },
                { name: 'DUTY', type: 'string' },
                { name: 'RMK', type: 'string' },
            ];
            
            setGrid();
            
            fnEditable(true);
			
			searchUser();


        });
        
        function setGrid(){
        	
			var style = {
// 					headerBackgroundColor: '#4267B2',
// 					headerColor: '#fff',
// 					headerBackgroundHoveredColor: '#FE6602',
// 					headerHoveredColor: '#fff',
// 					headerBackgroundSelectedColor: '#FC3752',
// 					headerSelectedColor: '#fff',
					backgroundColor: '#fff',
					color: '#333',
					backgroundHoveredColor: '#D3D3D3',
					hoveredColor: '#fff',
					backgroundSelectedColor: '#8AA0B3',
					selectedColor: '#fff'          
				};
			
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
                  { text: '코드', datafield: 'USER_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false, style: style },
                  { text: '성명', datafield: 'USER_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 110 , style: style },
                  { text: '성별', datafield: 'GENDER', columntype: 'combobox', cellsalign: 'center',align: 'center', width: 50, style: style },
                  { text: '휴대폰', datafield: 'MOBILE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 , style: style },
                  { text: '부서', datafield: 'DEPT', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 , style: style },
                  { text: '신급', datafield: 'BAPTISM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 , style: style },
                  { text: '직분', datafield: 'DUTY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 , style: style },
                  { text: '인도자', datafield: 'GUIDE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 110 , style: style },
                  { text: '구역', datafield: 'ZONE', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 , style: style },
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
         		    
         		    var userCode = $('#grid1').jqxGrid('getcellvalue', boundIndex, "USER_CODE");
					if(userCode != ''){
						selectOneUser(userCode);
					}
         		}); 
            
            
				var fnViewButton = function(){
		            return '<button onClick="fnSearchUser()" class="btn btn-outline-dark btn-sm" style="margin:5px; width:50px; height:30px">조회</button>';
		        };
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
                          { text: '자신코드', datafield: 'FAMILY_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 , hidden:true, editable : false},
                          { text: '코드', datafield: 'USER_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false},
                          { text: '성명', datafield: 'USER_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 },
                          { text: '조회', cellsalign: 'center',align: 'center', width: 60, cellsrenderer : fnViewButton, editable : false},
                          { text: '관계', datafield: 'RELATION', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                          { text: '성별', datafield: 'GENDER', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80},
                          { text: '생년월일', datafield: 'BIRTHDAY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 },
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
        
        function searchUser(){
        	
        	$("#modiBtn").addClass("d-none");
        	$("#saveBtn").addClass("d-none");
        	$("#delBtn").addClass("d-none");
        	
        	$("#fmAddBtn").addClass("d-none");
        	$("#fmsaveBtn").addClass("d-none");
        	$("#fmDelBtn").addClass("d-none");
        	
        	fnEditable(true);
        	fnFormInit();
        	
			var url = "/user/selectUserList.do";
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
        
        //상세보기
        function selectOneUser(userCode){
        	
        	fnFormInit();
        	fnEditable(true);
        	
        	$("#modiBtn").removeClass("d-none");
        	$("#saveBtn").addClass("d-none");
        	$("#delBtn").addClass("d-none");
        	
        	$("#fmAddBtn").removeClass("d-none");
        	$("#fmsaveBtn").removeClass("d-none");
        	$("#fmDelBtn").removeClass("d-none");

 		  	$.ajax({
		  	    url: '/user/selectOneUser.do',
		  	    method: 'post',
		  	    data: {sch_userCode : userCode},		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {

		  	    	var userinfo = data.data;
		  	    	
					$("#frm_user_code").val(userinfo.USER_CODE); 
					$("#frm_zone").val(userinfo.ZONE); 
					$("#frm_dept").val(userinfo.DEPT); 
					$("#frm_user_nm").val(userinfo.USER_NM);
					$("#frm_gender").val(userinfo.GENDER);  
					$('#frm_birthday').val(userinfo.BIRTHDAY);
					$("#frm_mobile").val(userinfo.MOBILE);
					$("#frm_email").val(userinfo.EMAIL);
					$("#frm_baptism").val(userinfo.BAPTISM); 
					$("#frm_duty").val(userinfo.DUTY); 
					$("#frm_guide").val(userinfo.GUIDE);
					$("#frm_zipcode").val(userinfo.ZIPCODE);
					$("#frm_address").val(userinfo.ADDRESS);
					$("#frm_phone").val(userinfo.PHONE);
					$("#frm_comp_zipcode").val(userinfo.COMP_ZIPCODE);
					$("#frm_comp_address").val(userinfo.COMP_ADDRESS);
					$("#frm_comp_phone").val(userinfo.COMP_PHONE);
					$("#frm_comp_nm").val(userinfo.COMP_NM);
					$("#frm_comp_position").val(userinfo.COMP_POSITION);
					$("#frm_rmk").val(userinfo.RMK);
		  	    	
					
					getFamilyList(userinfo.USER_CODE);
					
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("실폐하였습니다.!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	

        }
        
        //추가
        function addUserInfo(){
        	
        	
        	$("#mode").val("INSERT");
        	fnEditable(false);
  	    	fnFormInit();
        	
        	$("#modiBtn").addClass("d-none");
        	$("#saveBtn").removeClass("d-none");
        	$("#delBtn").addClass("d-none");
        	
        	$("#fmAddBtn").addClass("d-none");
        	$("#fmsaveBtn").addClass("d-none");
        	$("#fmDelBtn").addClass("d-none");
        }
        
        //수정
        function userModify(){
        	
        	$("#mode").val("UPDATE");
        	fnEditable(false);
        	
        	$("#modiBtn").addClass("d-none");
        	$("#saveBtn").removeClass("d-none");
        	$("#delBtn").addClass("d-none");
        	
        	$("#fmAddBtn").removeClass("d-none");
        	$("#fmsaveBtn").removeClass("d-none");
        	$("#fmDelBtn").removeClass("d-none");
        }
        
        //삭제
        function delRow(){
       		$("#mode").val("DELETE");
       		userSave();
        }
        
        //저장
        function userSave(){
        	
        	if($("#frm_user_nm").val() == "" && $("#mode").val() != "DELETE" ){
        		alert("성명은 필수 입니다.");
        		return false;
        	}
			var frm = $("#userInfoForm");
  	    	var informData = frm.serialize();
        	
  	    	var msg ="하시겠습니까?";
  	    	if($("#mode").val() =="INSERT") msg = "저장 " + msg; 
  	    	if($("#mode").val() =="UPDATE") msg = "수정 " + msg; 
  	    	if($("#mode").val() =="DELETE") msg = "삭제 " + msg; 
  	    	
  	    	
        	var result = confirm(msg);
        	if(result == true){	
        	
	 		  	$.ajax({
			  	    url: '/user/saveUserInfo.do',
			  	    method: 'post',
			  	    data: informData,		  	    
			  	    dataType : 'json',
			  	    success: function (data, status, xhr) {
			  	    	alert("정상 처리 되었습니다.");
			  	    	fnFormInit();
			  	    	searchUser();
			  	    },
			  	    error: function (data, status, err) {
			  	    	alert("실폐하였습니다.!");
			  	    },
			  	    complete: function () {
			  	    }
			  	});
        	}
        	
        }
        
		function fnEditable(str){
		
			$("#frm_zone").jqxComboBox({ disabled: str });
			$("#frm_dept").jqxComboBox({ disabled: str });
			$("#frm_user_nm").prop('readonly',str);
			$("#frm_gender").jqxComboBox({ disabled: str }); 
			$('#frm_birthday').jqxDateTimeInput({disabled: str });
			$("#frm_mobile").prop('readonly',str);
			$("#frm_email").prop('readonly',str);
			$("#frm_baptism").jqxComboBox({ disabled: str });
			$("#frm_duty").jqxComboBox({ disabled: str }); 	
			$("#frm_guide").prop('readonly',str);
			$("#frm_zipcode").prop('readonly',str);
			$("#frm_address").prop('readonly',str);
			$("#frm_phone").prop('readonly',str);
			$("#frm_comp_zipcode").prop('readonly',str);
			$("#frm_comp_address").prop('readonly',str);
			$("#frm_comp_phone").prop('readonly',str);
			$("#frm_comp_nm").prop('readonly',str);
			$("#frm_comp_position").prop('readonly',str);
			$("#frm_rmk").prop('readonly',str);
			
		}
		
		function fnFormInit(){
			
			$("#frm_user_code").val("");
			$("#frm_zone").jqxComboBox('clearSelection'); 
			$("#frm_dept").jqxComboBox('clearSelection'); 
			$("#frm_user_nm").val("");
			$("#frm_gender").jqxComboBox('clearSelection'); 
			$('#frm_birthday').val("");
			$("#frm_mobile").val("");
			$("#frm_email").val("");
			$("#frm_baptism").jqxComboBox('clearSelection'); 
			$("#frm_duty").jqxComboBox('clearSelection'); 
			$("#frm_guide").val("");
			$("#frm_zipcode").val("");
			$("#frm_address").val("");
			$("#frm_phone").val("");
			$("#frm_comp_zipcode").val("");
			$("#frm_comp_address").val("");
			$("#frm_comp_phone").val("");
			$("#frm_comp_nm").val("");
			$("#frm_comp_position").val("");
			$("#frm_rmk").val("");
			
		}
        
		function autoHyphen(obj){
			var newData = photoFormat(obj.value);
			obj.value = newData;
		}
		
		

        function getFamilyList(userCode){
			
        	var url = "/user/getFamilyList.do";
			var source =
			{
				method: 'post',
				datatype: "json",
				datafields: datafields2,
				data : {FAMILY_CODE : userCode},
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
        
        function fnFamilyAdd(){
        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
        	var cellValue = $('#grid1').jqxGrid('getcellvalue', mstRow, "USER_CODE");
        	if(cellValue !=null && cellValue != ""){
        		
        		var row = {};
        		row["CRUD"]  = "C";
        		row["FAMILY_CODE"]  = cellValue;
        		row["USER_CODE"]  = "";
        		row["USER_NM"]  = "";
        		row["GENDER"]  = "";
        		row["RELATION"]  = "";
        		row["BIRTHDAY"]  = "";
        		row["MOBILE"]  = "";
        		row["BAPTISM"]  = "";
        		row["DUTY"]  = "";
        		row["RMK"]  = "";
	        	$("#grid2").jqxGrid('addrow', 0, row, 'first');
	        	
	        	$("#grid2").jqxGrid('endrowedit', null, false);
        	}
        	
        }
        
        function fnFamilySave(){
        	
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
        			
        			if(rows[i].USER_NM == undefined || rows[i].USER_NM == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "USER_NM", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].GENDER == undefined || rows[i].GENDER == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "GENDER", "필수값입니다. ");
        				return false;
        			}
        			if(rows[i].RELATION == undefined || rows[i].RELATION == ""){
        				$("#grid2").jqxGrid('showvalidationpopup', i , "RELATION", "필수값입니다. ");
        				return false;
        			}
        			
        			if(rows[i].USER_CODE == undefined ) rows[i].USER_CODE = "";
        			if(rows[i].BIRTHDAY == undefined ) rows[i].BIRTHDAY = "";
        			if(rows[i].MOBILE == undefined ) rows[i].MOBILE = "";
        			if(rows[i].BAPTISM == undefined ) rows[i].BAPTISM = "";
        			if(rows[i].DUTY == undefined ) rows[i].DUTY = "";
        			if(rows[i].RMK == undefined ) rows[i].RMK = "";
       			
        			saveRows.push(rows[i]);
        		}
        	}
        	
        	if(saveRows.lenght == 0 ){
        		alert("수정된 데이터가 없습니다. ");
        		return false;
        	}
        	
 		  	$.ajax({
		  	    url: '/user/svaeFamilyInfo.do',
		  	    method: 'post',
		  	    data: {
		  	    	saveRows : JSON.stringify(saveRows)
		  	    },		  	    
		  	    dataType : 'json',
		  	    success: function (data, status, xhr) {
		  	    	
		        	
		        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
		        	var userCode = $('#grid1').jqxGrid('getcellvalue', mstRow, "USER_CODE");
		        	getFamilyList(userCode);
		        	
		  	    },
		  	    error: function (data, status, err) {
		  	    	alert("저장시 오류가 발생되었습니다!");
		  	    },
		  	    complete: function () {
		  	    }
		  	});
        	
        }
        
        
        function fnFamilyDel(){
        	
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
		
        function fnSearchUser(){
        	fnCommUserSearch("new","fnFailyAdd");
        }
		
        function fnFailyAdd(data){
        	var mstRow = $('#grid1').jqxGrid('getselectedrowindex');
        	var cellValue = $('#grid1').jqxGrid('getcellvalue', mstRow, "USER_CODE");
        	
        	var familyRow = $("#grid2").jqxGrid('getselectedrowindex');
        	
        	if(cellValue !=null && cellValue != ""){
        		
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "CRUD", "C");
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "FAMILY_CODE", cellValue);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "USER_CODE", data.USER_CODE);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "USER_NM", data.USER_NM);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "GENDER", data.GENDER);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "RELATION", "");
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "BIRTHDAY", data.BIRTHDAY);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "BAPTISM", data.BAPTISM);
        		$("#grid2").jqxGrid('setcellvalue', familyRow, "DUTY", data.DUTY);
        		
	        	$("#grid2").jqxGrid('endrowedit', null, false);
        	}
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
                                    	<div class="col-xl-8">
	                                    	<div class="float-start">
								                <table clase="w-100">
								                    <tr>
								                    	<td align="right" class="col-xl-2">
								                        	코드:
								                        </td>
								                        <td align="left" class="col-xl-4">
								                        	<input class="tbl-form-control w-100" id="sh_userCode" name="sh_userCode" />
								                        </td>
								                    	<td align="right" class="col-xl-2">
								                        	성명:
								                        </td>
								                        <td align="left" class="col-xl-4">
								                        	<input class="tbl-form-control w-100"  id="sh_userNm" name="sh_userNm"/>
								                        </td>
								                    </tr>
								                </table>
	                                        </div>
                                        </div>
                                        <div class="fcol-xl-4">
	                                        <div class="float-end align-middle">
		                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="searchUser()">조회</a>
		                                        <a class="btn btn-outline-dark btn-sm" href="#" Onclick="addUserInfo()">추가</a>
	                                        </div>
	                                    </div>
                                    </div>
	                            </div>
								<div id="grid1" class="my-1" ></div>
                            </div>
                            <div class="col-xl-7">
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start" style="padding:7px 0 7px 0">
                                        상세정보
                                        </div>
                                    	<div class="float-end">
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="modiBtn" Onclick="userModify()">수정</button>
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="saveBtn"  Onclick="userSave()">저장</button>
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="delBtn"  Onclick="delRow()">삭제</button>
                                        </div>
                                    </div>
                                </div>
								<div class="card-header-tabs my-1 p-2 " >
									<form id="userInfoForm" name="userInfoForm">
										<input id="mode" name="mode" type="hidden" />
					                <table clase="w-100 ">
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 코드: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-50" id="frm_user_code" name="frm_user_code" readonly /></td>
					                    	<td align="right" class="col-xl-1"> 구역: </td>
					                        <td align="left" class="col-xl-3"> <div class="tbl-form-control w-75"  id="frm_zone" name="frm_zone" ></div></td>
					                    	<td align="right" class="col-xl-1"> 부서: </td>
					                        <td align="left" class="col-xl-3">  <div class="tbl-form-control w-75"  id="frm_dept" name="frm_dept" ></div> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이름*: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="frm_user_nm" name="frm_user_nm" /> </td>
					                    	<td align="right" class="col-xl-1"> 성별: </td>
					                        <td align="left" class="col-xl-3"> <div class="tbl-form-control w-50"  id="frm_gender" name="frm_gender" ></div> </td>
					                    	<td align="right" class="col-xl-1"> 생년월일: </td> 
					                        <td align="left" class="col-xl-3"> <div class="tbl-form-control w-75"  id="frm_birthday" name="frm_birthday"></div></td>
					                    </tr>
					                    <tr>
											<td align="right" class="col-xl-1"> 휴대폰*: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100" id="frm_mobile" name="frm_mobile" oninput="autoHyphen(this)" maxlength="13" /> </td>
					                    	<td align="right" class="col-xl-1"> 신급: </td>
					                        <td align="left" class="col-xl-3">  <div class="tbl-form-control w-75"  id="frm_baptism" name="frm_baptism" ></div> </td>
					                    	<td align="right" class="col-xl-1"> 직분: </td>
					                        <td align="left" class="col-xl-3">  <div class="tbl-form-control w-75"  id="frm_duty" name="frm_duty" ></div> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 이메일: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-100"  id="frm_email"  name="frm_email"/> </td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td> 
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-75"  id="frm_phone"  name="frm_phone" /></td>
					                    	<td align="right" class="col-xl-1"> 인도자: </td> 
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-75"  id="frm_guide" name="frm_guide" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 주소: </td>
					                        <td align="left" class="col-xl-11" colspan=5>
					                        	<div class="float-start col-xl-2 mx-1">
					                        		<input class="tbl-form-control w-100" id="frm_zipcode" name="frm_zipcode" />
					                        	</div>
					                        	<div class="float-end col-xl-9 mx-1">
					                        		<input class="tbl-form-control w-100"  id="frm_address" name="frm_address" />
					                        	</div>
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 회사: </td>
					                        <td align="left" class="col-xl-11" colspan=5>
					                        	<div class="float-start col-xl-2 mx-1">
					                        		<input class="tbl-form-control w-100" id="frm_comp_zipcode" name="frm_comp_zipcode" />
					                        	</div>
					                        	<div class="float-end col-xl-9 mx-1">
					                        		<input class="tbl-form-control w-100"  id="frm_comp_address" name="frm_comp_address" />
					                        	</div>
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 회사전화: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-70"  id="frm_comp_phone" name="frm_comp_phone" /> </td>
					                    	<td align="right" class="col-xl-1"> 회사명: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-70" id="frm_comp_nm" name="frm_comp_nm" /> </td>
					                    	<td align="right" class="col-xl-1"> 직위: </td>
					                        <td align="left" class="col-xl-3"> <input class="tbl-form-control w-70"  id="frm_comp_position" name="frm_comp_position" /> </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 비고: </td>
					                        <td align="left" class="col-xl-11" colspan=5> <textarea rows="3" class="tbl-form-control w-100"  id="frm_rmk"  name="frm_rmk"></textarea></td>
					                    </tr>
					                </table>
									</form>
								</div>
                                <div class="card mb-0">
                                    <div class="card-header">
                                    	<div class="float-start">
                                        가족관계
                                        </div>
                                    	<div class="float-end">
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="fmAddBtn" Onclick="fnFamilyAdd()">추가</button>
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="fmsaveBtn"  Onclick="fnFamilySave()">저장</button>
	                                    	<button class="btn btn-outline-dark btn-sm d-none" id="fmDelBtn"  Onclick="fnFamilyDel()">삭제</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="grid2" class="my-1" ></div>
								
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
