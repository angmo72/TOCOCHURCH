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
	                                <div class="row mb-3">
	                                    <div class="col-md-6">
	                                        <div class="form-floating mb-3 mb-md-0">
	                                            <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" />
	                                            <label for="inputFirstName">First name</label>
	                                        </div>
	                                    </div>
	                                    <div class="col-md-6">
	                                        <div class="form-floating">
	                                            <input class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" />
	                                            <label for="inputLastName">Last name</label>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" />
	                                    <label for="inputEmail">Email address</label>
	                                </div>
	                                <div class="row mb-3">
	                                    <div class="col-md-6">
	                                        <div class="form-floating mb-3 mb-md-0">
	                                            <input class="form-control" id="inputPassword" type="password" placeholder="Create a password" />
	                                            <label for="inputPassword">Password</label>
	                                        </div>
	                                    </div>
	                                    <div class="col-md-6">
	                                        <div class="form-floating mb-3 mb-md-0">
	                                            <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
	                                            <label for="inputPasswordConfirm">Confirm Password</label>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="mt-4 mb-0">
	                                    <div class="d-grid"><a class="btn btn-primary btn-block" href="login.html">Create Account</a></div>
	                                </div>
	                            </form>
                            </div>
                        </div>
	                        
    	        	</div>
    	        </main>
<%@include file="../include/footer.jsp" %>
