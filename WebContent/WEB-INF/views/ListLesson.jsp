<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="getsubyoutube.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>List of Lesson</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="530785997801-2ro1qqmfpr4u419itskvereufo5d4431.apps.googleusercontent.com">
<style>
.gradient {
	-webkit-mask-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 1),
		rgba(0, 0, 0, .5) 30%, rgba(0, 0, 0, 1));
	-webkit-mask-image: linear-gradient(top, rgba(0, 0, 0, 1),
		rgba(0, 0, 0, .5) 30%, rgba(0, 0, 0, 1));
	font-weight: 600;
}
</style>
<body>
	<div class="container-fluid"
		style="padding: 0px !important; margin: 0px !important; position: relative;">

		<jsp:include page="_header_get.jsp"></jsp:include>
		<div class="container-fluid" style="margin-top: 50px">
			<h1 class="well well-sm" style="text-align: center">List of
				Lesson</h1>
			<div class="row" id="listlesson"></div>
		</div>
	</div>

	<script type="text/javascript">
		var email;
		$(document).ready(function() {
			// vì hàm này chạy trước nên các biến toàn cục sẽ không hiểu vì thế get email bằng cách lấy cookie
			<%String cookie = MyUtils.getUserNameInCookie(request);%>
			email = '<%=cookie%>';
			if(email == 'null'){
				alert('Please login!');
				window.location.href = "home";
			}
			var post = {
					email: email
			};
			$.post("listlesson", post).done(function(text) {
				if (text == "") {
					alert('Try again!');
				} else {
					$('#listlesson').html(text);
				}
			});
		});
		$("#getsub").click(function() {
			var url = $("input[name='getsub']").val();
			var key = url.split("?v=")[1];
			var key2 = key.split("&")[0];
			console.log(key2);
			window.location.href = "getsub?v=" + key2;
		});
	</script>
</body>
</html>