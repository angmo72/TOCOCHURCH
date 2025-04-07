/**
 * 공통함수 
 */

var sessionInfo 


//세션정보조회
function fnGetSessionInfo(){
	
	$.ajax({
	    url: '/getSessionInfo.do',
	    method: 'post',
	    data: {},		  	    
	    dataType : 'json',
	    success: function (data, status, xhr) {
			sessionInfo = data;
	    },
	    error: function (data, status, err) {
	    	alert("조회오류");
	    },
	    complete: function () {
	    }
	});
}

//url를 통해서 데이터 셋을 가지고 온다
function fnGetCodeListUrl(url, objId, grpCode, value, width, height){
	if(url == undefined || url =="") { url = "/sysCode/getDtlCodeList";}
	
	var source =
	{
	    datatype: "json",
		data : {grpCode : grpCode},
	    datafields: [
	        { name: 'CODE' },
	        { name: 'CODE_NM' }
	    ],
	    url: url,
	    async: false
	};
	var dataAdapter = new $.jqx.dataAdapter(source);
	// Create a jqxComboBox
	$("#"+objId).jqxComboBox({ 
		placeHolder: "선택",
//		selectedIndex: 0, 
		source: dataAdapter, 
		displayMember: "CODE_NM", 
		valueMember: "CODE", 
		width: "100%", 
		height: '30px',
	});
	
}

//그리드중 수정된 데이터 조회
//fnGetCodeList("objId아이디", "그룹코드");
function fnGetCodeList(objId, grpCode, value, width, height){
	var url = "/sysCode/getDtlCodeList.do";
	
	var source =
	{
	    datatype: "json",
		data : {grpCode : grpCode},
	    datafields: [
	        { name: 'CODE' },
	        { name: 'CODE_NM' }
	    ],
	    url: url,
	    async: false
	};
	var dataAdapter = new $.jqx.dataAdapter(source);
	// Create a jqxComboBox
	$("#"+objId).jqxComboBox({ 
		placeHolder: "선택",
//		selectedIndex: 0, 
		source: dataAdapter, 
		displayMember: "CODE_NM", 
		valueMember: "CODE", 
		width: "100%", 
		height: '30px',
	});
	
}


//그리드중 수정된 데이터 조회
//fnGetCodeList("objId아이디", "그룹코드", '첫번재 보일빈값'');
function fnSetCodeDiv(objId, dataAdapter, addStr){
	// Create a jqxComboBox
	$("#"+objId).jqxComboBox({ 
//		placeHolder: "선택",
//		selectedIndex: 0, 
		source: dataAdapter, 
		displayMember: "CODE_NM", 
		valueMember: "CODE", 
		width: "100%", 
		height: '30px',
	});
	
	//값추가
	if(addStr != undefined && addStr !="") {
		$("#"+objId).jqxComboBox('insertAt',{label:addStr, value:''}, 0);
	} 
}

//fnGridCodeList("objId아이디", "그룹코드");
function fnGridCodeList(grpCode, value, width, height){
	var url = "/sysCode/getDtlCodeList.do";
	
	var source =
	{
	    datatype: "json",
		data : {grpCode : grpCode},
	    datafields: [
	        { name: 'CODE' },
	        { name: 'CODE_NM' }
	    ],
	    url: url,
	    async: false
	};
	var dataAdapter = new $.jqx.dataAdapter(source);
	
	return dataAdapter;
}


//달력포멧 
function fnSetCalendar(objId, fromat, cwidth){
	if(cwidth == undefined || cwidth == "") cwidth ="150px";
	$("#"+objId).jqxDateTimeInput({
		animationType: 'fade', 
		width: cwidth, 
		height: '30px', 
//		formatString: 'Y',
		formatString: fromat,
//		culture: 'ko-KR',
		dropDownHorizontalAlignment: 'left'
	});	
}


//phone 포멧 세팅 000-0000-0000
function photoFormat(phone){
	
	const numbersOnly = phone.replace(/\D/g, ''); // 숫자만 남기기
	const match = numbersOnly.match(/^(\d{3})(\d{3,4})?(\d{4})?$/);

	if (match) {
	  return [match[1], match[2], match[3]].filter(Boolean).join('-');
	}
	return phone;
}

function fnCommUserSearch(mode, callbackObj){
	
	var opened = $("#commUserSearchPopWindow").jqxWindow('isOpen');
	if(opened == false){
		$('#commUserSearchPopWindow').jqxWindow('open');
		$("#commUserSrchUserCode").val("");
		$("#commUserSrchUserNm").val("");	
		$("#commUserSearchPopGrid").jqxGrid("clear");
	}
	
	$('#commUserSrchCallbackObj').val(callbackObj);
	
	if(mode == "new") return ;
	
//	if($("#commUserSrchUserCode").val() == "" && $("#commUserSrchUserNm").val() == ""){
//		alert("조회 조건을 넣어주세요");
//		return false;
//	}
//	
	srchUserDatafields = [
	    { name: 'USER_CODE', type: 'string' },
	    { name: 'USER_NM', type: 'string' },
	    { name: 'GENDER', type: 'string' },
	    { name: 'BIRTHDAY', type: 'string' },
	    { name: 'MOBILE', type: 'string' },
	    { name: 'BAPTISM', type: 'string' },
	    { name: 'DUTY', type: 'string' }
	];
	
	
	var url = "/user/selectUserList.do";
	var source =
	{
		method: 'post',
		datatype: "json",
		data : {
			sch_userCode : $("#commUserSrchUserCode").val(),
			sch_userNm : $("#commUserSrchUserNm").val(),
			},
		datafields: srchUserDatafields,
		id: 'id',
		url: url
	};
	var dataAdapter = new $.jqx.dataAdapter(source, {
	    downloadComplete: function (data, status, xhr) { },
	    loadComplete: function (data) { },
	    loadError: function (xhr, status, error) { }
	});

	$("#commUserSearchPopGrid").jqxGrid({
		source: dataAdapter
	});
	
}

//공통팝업 유저선택
function fnCommUserSelect(){

	//콜백 함수명	
	var callbackObj = $('#commUserSrchCallbackObj').val();

	// 선택row
	var sltRow = $("#commUserSearchPopGrid").jqxGrid('getselectedrowindex');
	if(sltRow < 0 ){
		alert("성도를 선택해주세요!"); 
		return;
	}
	var data = $('#commUserSearchPopGrid').jqxGrid('getrowdata', sltRow);
	
	//선택 데이터를 콜백함수 전달
	eval(callbackObj)(data);
	
	$('#commUserSearchPopWindow').jqxWindow('close');
	
}


//일자 계산
function fnAddDay(date, n) {
	return new Date(date.setDate(date.getDate() + n));
}

//천단위 콤마 펑션
function fnAddComma(value){
     value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value; 
 }
