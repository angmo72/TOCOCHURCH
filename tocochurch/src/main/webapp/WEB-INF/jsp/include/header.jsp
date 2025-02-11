<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
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
    	<script>
    		fnGetSessionInfo();
        	$(document).ready(function () {
        		$("#loginName").text(sessionInfo.sessName);
        	});
    	</script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-4" href="/">함께가는교회</a>
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
                        <li><a class="dropdown-item" href="/loginOut">Logout</a></li>
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
                                    <a class="nav-link" href="/user/userEdite">교인등록/수정</a>
                                    <a class="nav-link" href="/user/userManager">교인관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#offerToryLayouts" aria-expanded="false" aria-controls="offerToryLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                헌금관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="offerToryLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/offertory/offerInsert">헌금등록</a>
                                    <a class="nav-link" href="/offertory/offerManager">헌금조회</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#financeLayouts" aria-expanded="false" aria-controls="financeLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                재정관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="financeLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/finance/financeInsert">재정등록</a>
                                    <a class="nav-link" href="/finance/financeManager">재정조회</a>
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