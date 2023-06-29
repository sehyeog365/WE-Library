<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE-Library 로그인</title>
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
		<div class="login-box mt-3">
			<h2 class="text-center mt-3"><b>로그인</b></h2>
		
			<input type="text" id="loginIdInput" placeholder="로그인 ID" class="form-control mt-4">
			<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-4">
			
			<button type="button" class="btn btn-primary btn-block mt-3 mb-3" id="loginBtn">로그인</button>
		</div>
	
	
	</section>
	
		
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	
	$(document).ready(function(){
		
		$("#loginBtn").on("click", function(){
			
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			
			
			if(id == ""){
				alert("아이디를 입력하세요.");
				return ;	
			}
			
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return ;	
			}
			
			alert(id);
			alert(password);
			
			$.ajax({
				type: "post"
				, url: "/user/signin"
				, data:{"loginId":id, "password":password}
				, success:function(data){
					if(data.result == "success"){
						alert("로그인 성공");
						location.href="/library/main/view";
						
					} else {
						alert("로그인 실패");
					}
					
				}
				, error:function(){
					alert("로그인 오류");
					
				}	
				
			});
			
			
			
		});
		
		
		
	});
	
	</script>
	
	
</body>
</html>