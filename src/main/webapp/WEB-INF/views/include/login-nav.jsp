<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function() {

	$(".googleBtn").on("click",function() {
		location.href="${pageContext.request.contextPath}/googleLogin";
	});
	$(".facebookBtn").on("click",function() {
		location.href="${pageContext.request.contextPath}/facebookLogin";
	});

	$(".myBtnLogin").click(function() {
		$("#myModalLogin").modal("show");
	});

	$("#loginHide").click(function() {
		$("#myModalLogin").modal("hide");
	});

	$("#loginForm").on("submit", function() {
		 $.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/login",
				data : {
					 "mberId" : $("#loginId").val(),
					 "mberPw" : $("#loginPw").val()
				},
				dataType : "json",
				success : function(data) {
					 if (data.result) {
							$("#myModalLogin").modal("hide");
							window.location.reload();
					 } else {
							alert("비밀번호를 다시 입력해 주세요");
					 }
				},
				error : function() {
					 alert("아이디를 다시 입력해 주세요")
				}
		 });
		 return false;
	});
	//모달 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
			$(this).find('form')[0].reset()
	});


	$(".myBtnSignUp").click(function(){
			$("#myModalSignUp").modal("show");
	});

		$("#signUpHide").click(function() {
			$("#myModalSignUp").modal("hide");
		});

		$("#signUpForm").on("submit", function() {
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/join",
				data : {
					"signUpId" : $("#signUpId").val(),
					"signUpPw" : $("#signUpPw").val(),
					"signUpPwCheck" : $("#signUpPwCheck").val()

				},
				dataType : "json",
				success : function(data) {
					if (data.result) {
						// 회원가입 성공
						alert("해당 이메일로 인증 메일이 발송되었습니다");
						$("#myModalSignUp").modal("hide");
						window.location.reload();
					} else {
						//비밀번호가 다릅니다.
						$("#signUpFail").removeClass('hidden');
					}
				},
				error : function() {
					//이미 가입된 이메일입니다
					$("#signUpFail").removeClass('hidden');
				}
			});
			return false;
		});



});

</script>

<c:if test="${mberIndex == null}">

<nav class="navbar navbar-inverse">
  <div class="f-left">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH JOB</a>
  </div>
  <div class="f-right nav-btn-1">
    <div class="col-xs-6 cursorOn myBtnSignUp"><span class="glyphicon glyphicon-user"></span> Sign Up</div>
    <div class="col-xs-6 cursorOn myBtnLogin"><span class="glyphicon glyphicon-log-in"></span> Login</div>
  </div>
</nav>

  <!-- Modal -->
  <div class="modal fade" id="myModalLogin" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">

          <form role="form" method="post" id="loginForm">
						<div class="form-group has-feedback">
								<input type="email" class="form-control" id="loginId"   placeholder="Enter">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							 <input type="password" class="form-control" id="loginPw" placeholder="Password">
							 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>

					<div class="form-group row">
						<br><center><p>- OR -</p></center><br>
						<button class="btn col-xs-12 facebookBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> Sign in with facebook
						</button>
						<button class="btn col-xs-12 googleBtn" >
								<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> Sign in with Google &nbsp;&nbsp;
						</button>
					</div>

        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#myModalSignUp" data-toggle="modal" id="loginHide">Sign Up</a></p>
          <p>Forgot <a href="#">Password</a></p>
        </div>
      </div>
    </div>
  </div>

		<!-- Modal -->
		<div class="modal fade" id="myModalSignUp" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Sign Up
						</h4>
					</div>

					<div class="modal-body" style="padding: 40px 50px;">



						<form role="form" method="post" id="signUpForm">
							<div class="form-group has-feedback">
<!-- 								<label for="signUpId"> -->
<!-- 								<span class="glyphicon glyphicon-user"></span> -->
<!-- 								 Email Address -->
<!-- 								 </label> -->
								<input	type="email" class="form-control" id="signUpId"	placeholder="Email">
								<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
<!-- 								<label for="signUpPw"><span -->
<!-- 									class="glyphicon glyphicon-eye-open"></span> Password</label> -->
								<!-- 비밀번호 -->
								<input type="password" class="form-control" id="signUpPw" placeholder="Password">
								 <span class="glyphicon glyphicon-lock form-control-feedback"></span>
<!-- 								<span style="line-height: 50%"><br></span> -->
							</div>
					        <div class="form-group has-feedback">
								<!-- 비밀번호 확인  -->
								<input type="password" class="form-control" id="signUpPwCheck"	placeholder="Retype password">
								 <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
							</div>
							<button type="submit" class="btn btn-success btn-block">
								<span class="glyphicon glyphicon-off"></span> Sign Up
							</button>
							<!-- 회원가입 실패 시 보이는 창 -->
							<div class="form-group has-error has-feedback hidden"
								id="signUpFail">
								<div class="input-group">
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									</span> <input type="text" class="form-control" id="inputError"
										aria-describedby="inputGroupSuccess1Status"
										value="이메일 혹은 비밀번호가 유효하지 않습니다. 다시 시도하세요">
								</div>
							</div>
						</form>

						<div class="form-group row">
							<br><center><p>- OR -</p></center><br>
							<button class="btn col-xs-12 facebookBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/flogo-HexRBG-Wht-58.svg" alt="facebookLogo"> Sign in with facebook
							</button>
							<button class="btn col-xs-12 googleBtn" >
									<img src="${pageContext.request.contextPath}/resources/img/google-logo-01.svg" alt="googleLogo"> Sign in with Google &nbsp;&nbsp;
							</button>
						</div>

					</div>

					<div class="modal-footer">
						 <a href="#myModalLogin" data-toggle="modal" id="signUpHide">I already have a membership</a>
					</div>
				</div>

			</div>
		</div>


</c:if>

<!-- 로그인 후! -->
<c:if test="${mberIndex != null}">

	<nav class="navbar navbar-inverse">

		<div class="f-left">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">CATCH	JOB</a>
		</div>

		<div class="f-right nav-btn-1">

			<div class="dropdown col-xs-6 f-right" >

				<div class="dropdown-toggle cursorOn" data-toggle="dropdown"> <span	class="glyphicon glyphicon-user"></span> User <span class="caret"></span></div>
				<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dLabel">
					<li class="dropdown-header">활동내역</li>
					<li><a href="${pageContext.request.contextPath}/profile/reviews">기업리뷰 작성</a></li>
					<li><a href="${pageContext.request.contextPath}/profile/interviews">면접후기 작성</a></li>
					<li role="presentation" class="divider"></li>
					<li class="dropdown-header">관심정보</li>
					<li><a href="${pageContext.request.contextPath}/profile/follows">팔로잉 기업</a></li>
					<li><a href="${pageContext.request.contextPath}/profile/recent">최근 본 기업</a></li>
					 <li role="presentation" class="divider"></li>
					<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
				</ul>
			</div>

		</div>

	</nav>

</c:if>
