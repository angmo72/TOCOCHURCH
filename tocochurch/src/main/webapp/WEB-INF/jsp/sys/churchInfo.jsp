<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
                <main>
                    <div class="container-fluid px-2">
                    	<div>
                        <h4 class="mt-2">교회정보설정</h4>
                        </div>
                        <div>
                        <ol class="breadcrumb mb-2">
                            <li class="breadcrumb-item">시스템설정</li>
                            <li class="breadcrumb-item active">교회정보설정</li>
                        </ol>
                        </div>
                        <div class="card mb-2">
                            <div class="card-body">
	                            <form>
					                <table clase="w-100 ">
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 교회명: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-30" id="frm_US_CODE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 전화번호: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-20" id="frm_US_CODE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 팩스: </td>
					                        <td align="left" class="col-xl-7" colspan=3><input class="tbl-form-control w-20" id="frm_US_CODE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 주소: </td>
					                        <td align="left" class="col-xl-7" colspan=3>
					                        	<input class="tbl-form-control w-20" id="frm_US_CODE" />
					                        	<input class="tbl-form-control w-100" id="frm_US_CODE" />
					                        </td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 사업자번호: </td>
					                        <td align="left" class="col-xl-3" colspan=3><input class="tbl-form-control w-20" id="frm_US_CODE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 담임목사: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-30" id="frm_US_CODE" /></td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-70" id="frm_US_CODE" /></td>
					                    </tr>
					                    <tr>
					                    	<td align="right" class="col-xl-1"> 부목사: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-30" id="frm_US_CODE" /></td>
					                    	<td align="right" class="col-xl-1"> 연락처: </td>
					                        <td align="left" class="col-xl-3"><input class="tbl-form-control w-70" id="frm_US_CODE" /></td>
					                    </tr>
									</table>
										
	                                <div class="mt-4 mb-0">
	                                    <div class="d-grid"><a class="btn btn-primary btn-block" href="login.html">저장하기</a></div>
	                                </div>
	                            </form>
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
