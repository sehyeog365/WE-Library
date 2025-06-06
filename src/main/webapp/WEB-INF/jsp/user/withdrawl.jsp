<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>                   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 마이페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="contents d-flex justify-content-center">
		<div class="userinfo-page ">
			<div class="sub-profile bg-secondary">
				<c:import url="/WEB-INF/jsp/include/subprofile.jsp"/>
				<div class="sub-text">
					<h2 class="text-center text-white mt-3"><b>회원 탈퇴</b></h2>
				</div>
			</div>	
			
			<div class="d-flex mx-5">
			<c:import url="/WEB-INF/jsp/include/sidenav.jsp"/>
			<div class="d-flex justify-content-center col-9">
				<div class="user-box col-10 mt-3">
					<div class="mt-4 mx-4">※비밀번호를 입력하시고 홈페이지 회원 탈퇴 버튼을 클릭하시면 탈퇴처리가 완료됩니다.</div>
					<div class="ml-4 mt-4"><b>성명: </b>${user.name }</div>
					<div class="ml-4 mt-4"><b>아이디 : </b>${user.loginId }</div>
					<div class="d-flex">
						<label class=" ml-4 mt-4 font-weight-bold">비밀번호 입력</label> <input type="password" id="passwordInput" placeholder="비밀번호"  class="form-control col-8 ml-2 mt-4">
					</div>
				 	<div class="text-center">
						<button type="button" id="deleteBtn" class="btn btn-primary col-6 mt-3 mb-3"  data-user-id = "${user.id }">회원탈퇴 </button>
					</div>
				</div>
			</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
	
	$(document).ready(function(){
		$("#deleteBtn").on("click", function(){
			let id = $(this).data("user-id");
			let password = $("#passwordInput").val();
			var result = confirm("회원탈퇴 하시겠습니까?");
			
			if(password==""){
				alert("비밀번호를 입력하세요.");
			}
			
			if(result){
				alert("");
			} else {
				return ;
			}
			
			alert(id);
			alert(password);
			
			$.ajax({
				type :"get"
				, url :"/user/withdrawl"
				, data: {"id": id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						alert("회원탈퇴 성공");	
						location.href="/user/signin/view";
					} else {
						alert("회원탈퇴 실패");
					}
				}
				,error:function(){
					alert("회원탈퇴 에러");
				}
			});
		});
	});
	</script>
</body>
</html>