<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/function" prefix="fn" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>함께가는교회 ERP</title>
        <link rel="shortcut icon" href="#">
		<link rel="icon" href="data:;base64,iVBORw0KGgo=">
		<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
		
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="/js/all.js" crossorigin="anonymous"></script>
    	<script src="/js/jquery-3.7.1.min.js"></script>
    	<script src="/js/chrch.js"></script>
<!--     	<script type="text/javascript" src="/jqwidgets/globalization/globalize.culture.ko-KR.js"></script> -->
    	<script type="text/javascript" src="/jqwidgets/globalization/globalize.js"></script>
    	<script>
    		fnGetSessionInfo();
        	$(document).ready(function () {
        		$("#loginName").text(sessionInfo.sessName);
        		
        		
        		var commUserSearchPopContianer = $('#commUserSearchPopContianer');
        		var offset = commUserSearchPopContianer.offset();
        		$('#commUserSearchPopWindow').jqxWindow({  
        			width: 600,
        			height: 330, 
        			autoOpen: false,
        			resizable: false,
        			isModal: true, 
        			modalOpacity: 0.3,
        		    position: { x: offset.left + 150, y: offset.top + 150},
//         		    initContent: function () {
//         		        $('#commUserSrchButton').jqxButton({ width: '80px', disabled: true });
//         		    }
        		});
        		$("#commUserSearchPopWindow").prop("display","block");
        		
        	    $("#commUserSearchPopGrid").jqxGrid(
     	    	    {
     	    	        width: "100%",
     	    	        height: "250px",
     	    	        pageable: true,
//      	    	        autoheight: true,
     	    	        altrows: true,
     	    	        editable: false,
     	    	        enablebrowserselection : true,
//      	    	        selectionmode: 'checkbox',
     	    	        selectionmode: 'singlerow',
     	    	        columns: [
                            { text: '코드', datafield: 'USER_CODE', columntype: 'textbox', cellsalign: 'center', align: 'center', width: 80 ,editable : false},
                            { text: '성명', datafield: 'USER_NM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 120 },
                            { text: '성별', datafield: 'GENDER', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80},
                            { text: '생년월일', datafield: 'BIRTHDAY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 100 },
                            { text: '신급', datafield: 'BAPTISM', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 },
                            { text: '직분', datafield: 'DUTY', columntype: 'textbox', cellsalign: 'center',align: 'center', width: 80 }
     	    	        ]
     	    	    });
     	    	    $('#commUserSearchPopGrid').on('rowclick', function (event) 
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
        	    		
        		
        	});
    	</script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/churcherp.do"><img src="/img/logo.png"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul  class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </ul>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     <span id="loginName"></span> 
                    <i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
<!--                         <li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/loginOut.do">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#chUserLayouts" aria-expanded="false" aria-controls="chUserLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                교인관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="chUserLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/user/userEdite.do">교인관리</a>
                                    <a class="nav-link" href="/user/userPray.do">중보기도 및 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#offerToryLayouts" aria-expanded="false" aria-controls="offerToryLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                헌금관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="offerToryLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/offertory/offerInsert.do">헌금등록</a>
                                    <a class="nav-link" href="/offertory/offerManager.do">헌금조회</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#financeLayouts" aria-expanded="false" aria-controls="financeLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                재정관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="financeLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/finance/financeInsert.do">재정등록</a>
                                    <a class="nav-link" href="/finance/financeManager.do">재정조회</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#systemLayouts" aria-expanded="false" aria-controls="systemLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                시스템설정
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="systemLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/sys/churchInfo.do">교회정보설정</a>
                                    <a class="nav-link" href="/member/memberListView.do">관리자 관리</a>
                                    <a class="nav-link" href="/sysCode/codeListView.do">기준정보 관리</a>
                                </nav>
                            </div>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        함께가는교회
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            <%@include file="../include/commonHeader.jsp" %>