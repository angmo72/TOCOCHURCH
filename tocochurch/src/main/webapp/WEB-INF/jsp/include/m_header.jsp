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
        <meta name="description" content="대한예수교 장로회 천안 함께가는교회" />
        <meta name="author" content="" />
        <title>대한예수교장로회 함께가는교회</title>
<!--         <link rel="shortcut icon" href="#"> -->
<!-- 		<link rel="icon" href="data:;base64,iVBORw0KGgo="> -->
<!-- 		<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon"> -->
		
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="/js/all.js" crossorigin="anonymous"></script>
    	<script src="/js/jquery-3.7.1.min.js"></script>
    	<script src="/js/chrch.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/"><img src="/img/logo.png"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul  class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </ul>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#chUserLayouts" aria-expanded="false" aria-controls="chUserLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                교회소개
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="chUserLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/home/worshipInfo.do">예배안내</a>
                                    <a class="nav-link" href="/home/map.do">찾아오시는길</a>
                                    <a class="nav-link" href="/home/minister.do">교역자소개</a>
                                </nav>
                            </div>
                           
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#sermonLayouts" aria-expanded="false" aria-controls="sermonLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                설교말씀
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="sermonLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/sermon/sunService.do">주일예배</a>
                                    <a class="nav-link" href="/sermon/sunEvenService.do">주일저녁예배</a>
                                    <a class="nav-link" href="/sermon/wedService.do">수요예배</a>
                                    <a class="nav-link" href="/sermon/friService.do">금요기도회</a>
                                    <a class="nav-link" href="/sermon/morningWords.do">새벽기도회</a>
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