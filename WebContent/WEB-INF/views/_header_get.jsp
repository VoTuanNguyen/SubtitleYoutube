<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="getsubyoutube.utils.*"%>
<div class="col-md-12"
	style="box-shadow: 0px 3px 5px lightgrey; display: flex; padding: 10px 15px;">
	<div class="col-md-10" style="font-size: 23px; cursor: pointer">
		<div class="col-md-3 gradient" id="homeURL">English Subtitles</div>
		<div class="col-md-7" style="display: flex;">
			<input class="form-control col-md-8" name="getsub" type="text">
			<button class="btn col-md-2"
				style="font-weight: 600; margin-left: 10px;" id="getsub">Get</button>
		</div>
	</div>
	<div class="col-md-2" style="display: flex" id="userinfo">
		<div class="g-signin2" data-onsuccess="onSignIn" id="login-google">Đăng
			nhập</div>
	</div>
</div>
<script>
	var emailuser;
	var profile_user;
	var isClickLogin = false;
	
	$("#homeURL").click(function(){
		window.location.href = "home";
	})
	$("#login-google").click(function(e){// click login
		e.preventDefault();
		isClickLogin = true;//đã nhấn login
	});
	function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			emailuser = profile.getEmail();
			profile_user = profile;
			<%
				String cookie = MyUtils.getUserNameInCookie(request);
				if(cookie != null){
			%>	
				//nếu cookie của app của xóa
				$.ajax({
		                type: "POST",
		                url : "LoginServlet",
		                data: {email: profile.getEmail()},
		                success: function(responseText){
		                	$("#login-google").addClass("hidden");
		                	$("#userinfo").append('<div id="login-in" class="dropdown" style="cursor: pointer; padding-right: 0px;"><div class="dropdown-toggle" data-toggle="dropdown">Hi, '+profile.getName()+'<image class="" style="border-radius: 100px; margin-left: 15px;" src="'+profile.getImageUrl()+'" width="40" height="40" /><span class="caret"></span></div><ul class="dropdown-menu pull-right" style="width: 220px;"><li class="dropdown-header"></li><li id="gmail"><div class="row"><div class="col-md-2" style="padding-right: 0px;padding-left: 20px;"><image style="border-radius: 100px;" src="'+profile.getImageUrl()+'" width="40" height="40" /></div><div class="col-md-9" style= "padding-left:20px;"><div class="col-md-12"><strong>'+profile.getName()+'</strong></div><div class="col-md-12">'+profile.getEmail()+'</div></div></div></li><li class="divider"></li><li><a style="height: 35px;" href="#" id="getlesson"><i class="fa fa-list-alt" aria-hidden="true" style="margin-right: 35px; font-size: 20px; margin-top: 5px;"></i>List of lesson</a></li><li><a style="height: 35px;" href="#" id="sign-out"><i class="fa fa-sign-out" aria-hidden="true" style="margin-right: 35px; font-size: 20px; margin-top: 5px;"></i>Logout</a></li></ul></div>');
		                	//$("#userinfo").append('<button id="sign-out" style="margin-left:10px;" class="btn btn-basic fa fa-power-off"> Sign Out</button>')
		                }
		        	});
			<%	}else{%>
					///cookie đã bị xóa và người dùng muốn đăng nhập lại
					if(isClickLogin){// cho biết người dùng đã nhấn nút đăng nhập chưa???
						$.ajax({
			                type: "POST",
			                url : "LoginServlet",
			                data: {email: profile.getEmail()},
			                success: function(responseText){
			                	$("#login-google").addClass("hidden");
			                	$("#userinfo").append('<div id="login-in" class="dropdown" style="cursor: pointer; padding-right: 0px;"><div class="dropdown-toggle" data-toggle="dropdown">Hi, '+profile.getName()+'<image class="" style="border-radius: 100px; margin-left: 15px;" src="'+profile.getImageUrl()+'" width="40" height="40" /><span class="caret"></span></div><ul class="dropdown-menu pull-right" style="width: 220px;"><li class="dropdown-header"></li><li id="gmail"><div class="row"><div class="col-md-2" style="padding-right: 0px;padding-left: 20px;"><image style="border-radius: 100px;" src="'+profile.getImageUrl()+'" width="40" height="40" /></div><div class="col-md-9" style= "padding-left:20px;"><div class="col-md-12"><strong>'+profile.getName()+'</strong></div><div class="col-md-12">'+profile.getEmail()+'</div></div></div></li><li class="divider"></li><li><a style="height: 35px;" href="#" id="getlesson"><i class="fa fa-list-alt" aria-hidden="true" style="margin-right: 35px; font-size: 20px; margin-top: 5px;"></i>List of lesson</a></li><li><a style="height: 35px;" href="#" id="sign-out"><i class="fa fa-sign-out" aria-hidden="true" style="margin-right: 35px; font-size: 20px; margin-top: 5px;"></i>Logout</a></li></ul></div>');
			                	//$("#userinfo").append('<button id="sign-out" style="margin-left:10px;" class="btn btn-basic fa fa-power-off"> Sign Out</button>')
			                }
			        	});
					}// nếu người dùng k nhấn đăng nhập thì vẫn như cũ
					else{
		            	emailuser = null;// set biến email về null
					}
			<%	}%>
			
		}
	
	$("#userinfo").on("click", "#sign-out", function(e){
		e.preventDefault();
		isClickLogin = true;//khi đăng xuất thì biến này sẽ được reset về false
		$.ajax({
            type: "GET",
            url : "LogoutServlet",
            success: function(responseText){
            	$("#sign-out").remove();
            	$("#login-in").remove();
            	$("#login-google").removeClass("hidden");
            	emailuser = null;// set biến email về null
            }
    	});
	});
	$("#userinfo").on("click", "#getlesson", function(e){
		e.preventDefault();
		window.location.href = "lesson";
	});
	$("#userinfo").on("click", "#gmail", function(e){
		e.preventDefault();
		window.location.href = "https://gmail.com";
	});
</script>