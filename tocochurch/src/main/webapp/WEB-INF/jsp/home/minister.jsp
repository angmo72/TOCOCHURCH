<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/m_header.jsp" %>
<%
String liveInfo = (String) request.getAttribute("YOUTUBE_LIVE");
%>
<script type="text/javascript">
    var datafields = "";
    var menuCrtDatadaptor = "";
    $(document).ready(function () {
   	
    	
    });
    
</script>
        
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">교역자 소개</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">교회소개 > 교역자 소개</li>
                        </ol>
                        
                        <div class="row">
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        강명호 목사
                                    </div>
                                    <div class="card-body">
		                                <table id="nightWorshipTable">
		                                    <tbody>
		                                    	<tr>
		                                    		<td> 함께가는교회 담임 </td>
		                                    	</tr>
		                                    	<tr>
		                                    		<td> 총신대학교 신학대학원 </td>
		                                    	</tr>
		                                    </tbody>
		                                </table>
									</div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        강치현 목사
                                    </div>
                                    <div class="card-body">
		                                <table id="wendWorshipTable">
		                                    <tbody>
		                                    	<tr>
		                                    		<td> 청년/청소년부 담당</td>
		                                    	</tr>
		                                    	<tr>
		                                    		<td> 칼빈대학교 신학대학원 </td>
		                                    	</tr>
		                                    </tbody>
		                                </table>
									</div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        강소이 전도사
                                    </div>
                                    <div class="card-body">
		                                <table id="fridWorshipTable">
		                                    <tbody>
		                                    	<tr>
		                                    		<td> 주일학교 담당 </td>
		                                    	</tr>
		                                    	<tr>
		                                    		<td> 백석대학교 신학과 </td>
		                                    	</tr>
		                                    </tbody>
		                                </table>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
<%@include file="../include/m_footer.jsp" %>

