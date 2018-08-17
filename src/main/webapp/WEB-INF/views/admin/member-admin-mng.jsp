<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
<style>
	.row{
		padding:15px;
	}
	.page-header{
		text-align: center; 
		font-weight: bold;
	}
	#quantity{
		width: 90px; 
		height: 25px";
	}
</style>
<script>
	function newPage() {		
		var url="mngAdmin?msgPerPage="+$("#quantity").val();		
		window.location=url;
	}
</script>
<body>
	<%@ include file="/WEB-INF/views/admin/include/admin-nav-sidebar.jsp"%> 
		<div class="col-sm-9 main">
			<h1 class="page-header" style="margin-bottom: 50px">[ 관리자 그룹 관리 ]</h1><br>
				<div class="col-md-offset-1">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-5">
									<label for="quantity">
									<input type="number" min="5" max="15" step="5" id="quantity" value="${viewData.msgPerPage}"
									 onclick="newPage()">
									&nbsp; entries</label></div> 	

								<form action="search" class="form-inline pull-right">
									<div class="input-group">
										<input type="text" name="keyword" class="form-control"
											size="20" style="height: 28px">
										<div class="input-group-btn">
											<button type="button" class="btn">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>NO</th>
										<th>아이디</th>
										<th>권한</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="admins" items="${viewData.boardList}">
										 <tr>	
										<td>${admins.adminIndex}</td>
										<td><a href="mngAdmin?num=${admins.adminIndex}">${admins.adminId}</a></td>
										<td>${admins.adminLv}</td> 
										</tr> 
									</c:forEach> 
								</tbody>
							</table>
							
						<div class="pagination" id="pagination">
								<ul class="pagination pagination-sm">
									<c:if test="${viewData.startPage != 1}">	
										<li class="page-item"><a class="page-link"  aria-label="Previous"
										 	href="mngAdmin?page=${viewData.startPage-1}">
										이전</a></li>
									</c:if>
									<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
										<c:choose>
											<c:when test="${pageNum == viewData.currentPage}">
												<li class="page-item active" > <a class="page-link" 						
												href="mngAdmin?page=${pageNum}">${pageNum}<span class="sr-only">(current)</span></a>
											</c:when>
											<c:otherwise>
												<li class="page-item"> <a class="page-link" href="mngAdmin?page=${pageNum}">${pageNum}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${viewData.endPage < viewData.pageTotalCount}">
										<li class="page-item"><a class="page-link" href="mngAdmin?page=${viewData.endPage+1}">
										다음</a></li>
									</c:if>
								</ul> 
							</div>	
						</div>

						<div class="col-md-5 pull-right">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="id" class="col-sm-4 control-label">아이디</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputEmail3"
											placeholder="아이디" value="${admin.adminId}">
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-4 control-label">비밀번호</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password"
											placeholder="비밀번호" value="${admin.adminPw}">
									</div>
								</div>

								<div class="form-group" style="text-align: right">
									<label for="level" class="control-label"
										style="margin-right: 15px">권한</label>
									<div class="col-sm-8 pull-right">
										<select class="form-control" style="color:gray">
											<option value="" selected disabled hidden>level${admin.adminLv}</option>
											<option>level1</option>								
											<option>level2</option>
											<option>level3</option>
											<option>level4</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="regDate" class="col-sm-4 control-label">가입날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="regDate"
											placeholder="가입날짜" value="${admin.regDate}">
									</div>
								</div>
								<div class="form-group">
									<label for="lastDate" class="col-sm-4 control-label">최근
										방문날짜</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="lastDate"
											placeholder="최근 방문날짜" value="${admin.lastDate}">
									</div>
								<!-- </div>
								<div class="form-group">
									<div class="col-sm-4 control-label" style="font-weight: bold">사용
										여부</div>
									<div class="col-offset-1 col-sm-3">
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio1" value="option1">
											사용
										</label>
									</div>
									<div>
										<label class="radio-inline"> <input type="radio"
											name="inlineRadioOptions" id="inlineRadio2" value="option2">
											미사용
										</label>
									</div>
								</div>
			 -->
								
								<div class="form-group">
									<div class="col-sm-offset-8 col-sm-6">
										<input type="submit" class="btn btn-info" value="수정하기">
										<input type="reset" class="btn btn-warning" value="초기화">
									</div>
								</div>
							</form>
						</div>
				</div>
			</div><!-- div id="content" end -->			
		</div>	<!--<div class="row"> end -->
	</div><!--<div class="container-fluid"> end -->

</body>
</html>