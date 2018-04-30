<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Home</title>
<style type="text/css">
.gradient {
	-webkit-mask-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 1),
		rgba(0, 0, 0, .5) 30%, rgba(0, 0, 0, 1));
	-webkit-mask-image: linear-gradient(top, rgba(0, 0, 0, 1),
		rgba(0, 0, 0, .5) 30%, rgba(0, 0, 0, 1));
	font-weight: 600;
}

.site-footer {
	background-color: #1b2940;
	color: white;
	width: 100%;
	position: absolute;
	bottom: 0px;
}

.bottom-footer {
	border-top: 1px solid white;
	margin-top: 10px;
	padding-top: 10px;
	color: #b2b2b2;
}

.footer-nav {
	text-align: right;
	list-style: none;
}

.footer-nav li {
	display: inline;
}

.footer-nav li:not(:first-child ):before {
	content: '|';
	padding: 0px 10px;
}

.footer-nav a {
	color: #b2b2b2;
}

.footer-nav a:hover {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid"
		style="padding: 0px !important; margin: 0px !important; position: relative;">

		<jsp:include page="_header.jsp"></jsp:include>

		<div class="col-md-12" style="margin-top: 120px;">
			<div class="col-md-12"
				style="display: flex; flex-direction: column; align-items: center;">
				<div class="gradient" style="font-size: 72px;">Get Subtitle</div>
				<div class="col-md-7" style="display: flex; margin-top: 10px;">
					<input class="form-control col-md-8" name="getsub" type="text">
					<button class="btn col-md-2"
						style="font-weight: 600; margin-left: 10px;" id="getsub">Get</button>
				</div>
			</div>
		</div>

		<!-- <div class="footer col-md-12">
		Thiết kế phần mềm giáo dục
	</div> -->

	</div>
	<!--Bắt đầu footer-->
	<!-- <footer class="site-footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<p style="font-size: 18px; text-align: center; color: red;">
					Giới thiệu</p>
				<p>Đây là ứng dụng English Youtube Subtitles của nhóm 4</p>
				<p>Môn học: Thiết kế phần mềm giáo dục</p>
				<p>Giáo viên hướng dẫn: Đặng Thanh Dũng</p>
				<p>Trường Đại học sư phạm kỹ thuật TPHCM</p>
			</div>
			<div class="col-md-4">
				<p style="font-size: 18px; text-align: center; color: red;">
					Thông tin liên lạc</p>
				<p>
					<b>Email: </b><span><u style="color: blue;">votongpm@gmail.com</u></span>
				</p>
				<p>
					<b>Facebook: </b><span><a
						href="https://www.facebook.com/L%E1%BA%ADp-Tr%C3%ACnh-web-718076578344350/"
						style="">Facebook/YoutubeSubtitles</a></span>
				</p>
				<p>
					<b>Điện thoại: </b>0974995036
				</p>
			</div>
			<div class="col-md-4">
				<p style="font-size: 18px; text-align: center; color: red;">
					Hướng dẫn đăng nhập</p>
				<p>
					<b>1. </b>Bấm vào nút đăng nhập bằng gmail ở bên góc trên bên phải
					màn hình
				</p>
				<p>
					<b>2. </b>Chọn tài khoản gmail để đăng nhập
				</p>

			</div>
		</div>
		<div class="row">
			<div class="bottom-footer">
				<div class="col-md-5">
					<p>
						<b>&copy;Copyright EnglishYoutubeSubtitles 2018</b>
					</p>
				</div>
				<div class="col-md-7">
					<ul class="footer-nav">
						<li><a href="http://hcmute.edu.vn/">Home</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="http://facebook.com/">Facebook</a></li>
						<li><a href="http://gmail.com/">Gmail</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</footer>  -->
	<script type="text/javascript">
		$("#getsub").click(function() {
			var url = $("input[name='getsub']").val();
			var key = url.split("?v=")[1];
			var key2 = key.split("&")[0];
			console.log(key2);
			window.location.href = "getsub?v=" + key2;
		});
		/* function onSignIn(googleUser) {
			
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		} */
	</script>
</body>
</html>