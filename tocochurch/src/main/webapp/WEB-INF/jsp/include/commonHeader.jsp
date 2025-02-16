<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 공통 팝업 관리 -->
<div id="commUserSearchPopContianer">
    <div id="commUserSearchPopWindow" style="display:none">
        <div id="commUserSearchPopWindowHeader">
            <span id="commUserSearchPopTile" style="float: left">성도 검색</span>
        </div>
        <div id="commUserSearchPopContent" style="overflow: hidden">
			<div class="card-header">
				<div class="col-xl-8">
					<div class="float-start">
		              <table clase="w-100">
		                  <tr>
		                  	<td align="right" class="col-xl-2">
		                      	코드:
		                      </td>
		                      <td align="left" class="col-xl-4">
		                      	<input class="tbl-form-control w-100" id="commUserSrchUserCode" name="commUserSrchUserCode" />
		                      	<input class="tbl-form-control w-100" id="commUserSrchCallbackObj" name="commUserSrchCallbackObj" type="hidden"/>
		                      </td>
		                  	<td align="right" class="col-xl-2">
		                      	성명:
		                      </td>
		                      <td align="left" class="col-xl-4">
		                      	<input class="tbl-form-control w-100"  id="commUserSrchUserNm" name="commUserSrchUserNm"/>
		                      </td>
		                  </tr>
		              </table>
					</div>
				</div>
				<div class="fcol-xl-4">
 					<div class="float-end align-middle">
						<a class="btn btn-outline-dark btn-sm" href="#" Onclick="fnCommUserSearch('search')">조회</a>
						<a class="btn btn-outline-dark btn-sm" href="#" Onclick="fnCommUserSelect()">선택</a>
						<a class="btn btn-outline-dark btn-sm" href="#" Onclick="$('#commUserSearchPopWindow').jqxWindow('close')">닫기</a>
					</div>
				</div>
			</div>
	        <div id="commUserSearchPopGrid"></div>
	    </div>
	</div>
</div>