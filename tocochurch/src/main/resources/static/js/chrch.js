/**
 * 공통함수 
 */

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
		selectedIndex: 0, 
		source: dataAdapter, 
		displayMember: "CODE_NM", 
		valueMember: "CODE", 
		width: "100%", 
		height: '30px',
	});
	
}


function fnSetCalendar(objId, value, s_width, s_height){
	$("#"+objId).jqxDateTimeInput({
		animationType: 'fade', 
		width: '150px', 
		height: '30px', 
		formatString: 'yyyy-MM-dd',
		dropDownHorizontalAlignment: 'right'
	});	
}