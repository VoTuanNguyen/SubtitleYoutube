<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE >
<html>
<head>
<title>Upload files</title>
<link rel="stylesheet" media="all"
	href="./JS&CSS/InstructureIcons-Solid.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div style="padding: 5px; color: red; font-style: italic;">
		${errorMessage}</div>

	<div class="row">
		<div class="col-xs-3"></div>

		<div class="col-xs-6">
			<h2>Upload Files</h2>

			<form method="post"
				action="${pageContext.request.contextPath}/uploadFile"
				enctype="multipart/form-data">
				<strong><h4>Select video to upload(Please select the video
						format as *.mp4 or *.MP4. Maximum allowed size: <1GB):</h4></strong> <input id="video" type="file"
					name="file" /> <br> <strong><h4>Select sub-file to
						upload(Please select the sub-file format as *.srt):</h4></strong> <input
					id="sub" type="file" name="file" /> <br> <input id="submit"
					type="submit" class="btn btn-primary" value="Upload to learn" />
			</form>
		</div>
	</div>
	<script>
		$("#submit").click(function() {
			var video = $("#video").val();
			var sub = $("#sub").val();
			if (video == "") {
				alert("Please select video!");
				return false;
			}
			if (sub == "") {
				alert("Please select sub-file!");
				return false;
			}
			var dvi = video.split('.');
			if (dvi[1] != "mp4" && dvi[1] != "MP4") {
				alert("Wrong video format! Please reselect video!");
				return false;
			}
			var dsub = sub.split('.');
			if (dsub[1] != "srt") {
				alert("Wrong sub-file format! Please reselect sub-file!");
				return false;
			}

		});
	</script>
</body>
</html>