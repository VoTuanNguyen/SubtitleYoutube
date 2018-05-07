<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="getsubyoutube.servlet.*"%>
<%@page import="getsubyoutube.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Learn video from local</title>
</head>
<link rel="stylesheet" href="./JS&CSS/youtubeIt.css">
<link href="./JS&CSS/css.css" rel="stylesheet">
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
<script type="text/javascript" src="./ckeditor/ckeditor.js">	
</script>
<link href="http://vjs.zencdn.net/4.12/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/4.12/video.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="548616172439-1qe4veddhcntj2faqct82hcr42fij3ag.apps.googleusercontent.com">
<title>Get Subtitle</title>
<style type="text/css">
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
		style="padding: 0px !important;; margin: 0px !important;">

		<jsp:include page="_header_get.jsp"></jsp:include>
		
		<div class="ic-Layout-contentMain" style="margin-top: 70px; background-image: url('./images/background.jpg');">
			<div class="content-box" id="top_area">
				<div class="grid-row">
					<div class="col-xs-6">
						<div class="" style="position: relative; padding-bottom: 56.25%; /* 16:9 */ padding-top: 25px; height: 0;" id="youTubeVideo">
							<video id="myVideo" class="video-js vjs-default-skin" controls width="620" height="570"> 
								<source src="" type="video/mp4">
							</video>
						</div>
					</div>
					<div class="col-xs-6" id="transcript">
						<div class="row" style="margin-top: 10px">
							<div class="col-sm-6">
								<h4>Video Transcript</h4>
							</div>
							<div class="col-sm-3">
								<a href="${pageContext.request.contextPath}/uploadFile" class="btn btn-primary fa fa-upload" style="font-size: 16px;"
									> Upload video</a>
							</div>
							<div class="col-sm-3">
								<button data-target="#titlelesson" data-toggle="modal"
									class="btn btn-primary fa fa-save" style="font-size: 16px;"
									id="savelesson"> Save lesson</button>
							</div>
						</div>
						<div class="mmocVideoTranscript" id="videoTranscript"
							style="border-style: solid;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="insertnote" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"> Add note</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 col-sm-12">
									<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
								</div>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<div class="row">
						<button id="add" class="col-md-2 btn btn-primary"
							style="margin-left: 120px;">Add</button>
						<button class="col-md-2 btn btn-primary"
							style="margin-left: 300px" id="cancel" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="titlelesson" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add title for lesson</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
						  <input type="text" class="form-control" id="title_lesson">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<div class="row">
						<button id="add_lesson" class="col-md-2 btn btn-primary"
							style="margin-left: 50px;" data-dismiss="modal">Save lesson</button>
						<button class="col-md-2 btn btn-primary"
							style="margin-left: 300px" id="" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
    </div>

	<script>
        window.onload = function(){
            for(var i=0; i<arrnote.length; i++){
                var p = arrnote[i].pos;
                if(p < 6){
                    $("#t"+p).popover({
                        html: true,
                        title: '<center>Note<center><a class="close" data-position="'+p+'" style="position: absolute; top: 0; right: 6px;" href="#");">&times;</a>',
                        content: arrnote[i].content,
                        trigger: "manual",
                        placement: "bottom"
                    });
                }else{
                    $("#t"+p).popover({
                        html: true,
                        title: '<center>Note<center><a class="close" data-position="'+p+'" style="position: absolute; top: 0; right: 6px;" href="#");">&times;</a>',
                        content: arrnote[i].content,
                        trigger: "manual",
                        placement: "top"
                    });
                }
            }
            $(document).on('click', '.close', function() {
                var posi = $(this).data('position');
                $("#t"+posi).popover('hide');
            });
            $('.ic-Layout-contentMain').height($( document ).height()-70);
        };
    </script>
	<script>
		$(function() {
			var windowH = $(window).height();
			var wrapperH = $('.mmocVideoTranscript').height();
			if (windowH > wrapperH) {
				$('.mmocVideoTranscript').css({
					'height' : ($(window).height() - 150) + 'px'
				});
			}
			$(window).resize(function() {
				var windowH = $(window).height();
				var wrapperH = $('.mmocVideoTranscript').height();
				if (windowH > wrapperH) {
					$('.mmocVideoTranscript').css({
						'height' : ($(window).height() - 150) + 'px'
					});
				}

			})
		});
	</script>

	<script type="text/javascript">
		var src;
		var pos;
		var captions;
		var vid = document.getElementById("myVideo");
		var link = window.location.href;
		var arrlst = link.split('?');
		var lst = arrlst[1].split('&');
		var namevideo = lst[0].split('=')[1];
		var namesub = lst[1].split('=')[1];
		var linkhost = arrlst[0].split('videolocal')[0] + 'uploadDir/';//hoặc là cắt chuỗi arrlst[1] để lấy
		vid.src = linkhost + namevideo;
		var idvideo = namevideo;
		var arrnote;
		var clickvideo = false;
		var video_status = false;// not playing
		
		//xử lý các phím mũi tên
		$(document).keydown(function(e) {
		    switch(e.which) {
		    	case 32: //space
		    		if(clickvideo && video_status){
		    			vid.pause();//dừng video
		    		}else if(clickvideo && !video_status){
		    			vid.play();//chạy video
		    		}
		    	break;
		        case 37: // left
		        	if(vid.currentTime >=5 && clickvideo){
			            vid.currentTime = vid.currentTime - 5;
		        	}else if(clickvideo){
		        		vid.currentTime = 0;
		        	}
		        break;
		
		        case 38: // up
		        	if(clickvideo && vid.volume <= 0.95){
		        		vid.volume = vid.volume + 0.05;
		        	}else if(clickvideo){
		        		vid.volume = 1;
		        	}
		        break;
		
		        case 39: // right
		        	if(vid.currentTime <= (vid.duration -5) && clickvideo){
			            vid.currentTime = vid.currentTime + 5;
		        	}else if(clickvideo){
		        		vid.currentTime = vid.duration;
		        	}
		        break;
		
		        case 40: // down
		        	if(clickvideo && vid.volume >= 0.05){
		        		vid.volume = vid.volume - 0.05;
		        	}else if(clickvideo){
		        		vid.volume = 0;
		        	}
		        break;
		
		        default: return; // exit this handler for other keys
		    }
		    e.preventDefault(); // prevent the default action (scroll / move caret)
		});
		
		//bắt sự kiện click video
		$(document).mouseup(function(e) 
		{
		    var container = $("#myVideo");
		    // if the target of the click isn't the container nor a descendant of the container
		    if (!container.is(e.target) && container.has(e.target).length === 0) 
		    {
		    	clickvideo = false;//chưa click vô video
		    }else{
		    	clickvideo = true;// đã click vô video
		    }
		});
		
		//tính thời gian
		function makeTimeline(time) {
			var string, time_array = [];

			time_array.push(Math.floor(time / (60 * 60)));
			time_array
					.push(Math.floor((time - (time_array[0] * 60 * 60)) / 60));
			time_array.push(Math.floor(time
					- ((time_array[1] * 60) + (time_array[0] * 60 * 60))));

			for (var i = 0, il = time_array.length; i < il; i++) {
				string = '' + time_array[i];
				if (1 === string.length) {
					time_array[i] = '0' + string;
				}
			}
			return time_array.join(':');
		};
		function returnTimeline(text) {
			var arr = text.split(',');
			var chartime = arr[0];
			var arrtimeline = chartime.split(':');
			var time = parseFloat(arrtimeline[0]) * 60 * 60
					+ parseFloat(arrtimeline[1]) * 60
					+ parseFloat(arrtimeline[2]) + parseFloat(arr[1]) / 1000;
			return time;
		}
		function transcript(transcriptId) {
			var currentTime = 0;

			var transcriptId = transcriptId;
			//Array of captions in video
			var captionsLoaded = false;

			//Timeout for next caption
			var captionTimeout = null;
			
			//Interval for next request
			var intervalTimeOut = null;

			//Keep track of which captions we are showing
			var currentCaptionIndex = 0;
			var nextCaptionIndex = 0;
			var findCaptionIndexFromTimestamp = function(timeStamp) {
				var start = 0;
				var duration = 0;
				for (var i = 0, il = captions.length; i < il; i++) {
					start = Number(getStartTimeFromCaption(i));
					duration = Number(getDurationFromCaption(i));
					//Return the first caption if the timeStamp is smaller than the first caption start time.
					if (timeStamp < start) {
						break;
					}

					//Check if the timestamp is in the interval of this caption.
					if ((timeStamp >= start)
							&& (timeStamp < (start + duration))) {
						break;
					}
				}
				return i;
			}
			var clearCurrentHighlighting = function() {
				var timeStampId = getTimeIdFromTimestampIndex(currentCaptionIndex);
				$("#" + timeStampId).css('background-color', '');
				for(var i=0; i<src.length; i++){
					$("#t"+i).popover('hide');
				}
			}

			var highlightNextCaption = function() {
				var timestampId = getTimeIdFromTimestampIndex(nextCaptionIndex);
				$("#" + timestampId).css('background-color', 'yellow');
			}

			var calculateTimeout = function(currentTime) {
				var startTime = Number(getStartTimeFromCaption(currentCaptionIndex));
				var duration = Number(getDurationFromCaption(currentCaptionIndex));
				var timeoutValue = startTime - currentTime + duration;
				return timeoutValue;
			}

			this.setCaptionTimeout = function(timeoutValue) {
				if (timeoutValue < 0) {
					return;
				}

				clearTimeout(captionTimeout);

				var transcript = this;

				captionTimeout = setTimeout(function() {
					transcript.highlightCaptionAndPrepareForNext();
				}, timeoutValue * 1000);
			}

			var getStartTimeFromCaption = function(i) {
				if (i >= captions.length) {
					return -1;
				}
				return returnTimeline(captions[i].start_time);
			}
			var getDurationFromCaption = function(i) {
				if (i >= captions.length) {
					return -1;
				}
				return returnTimeline(captions[i].end_time) - returnTimeline(captions[i].start_time);
			}
			var getTimeIdFromTimestampIndex = function(i) {
				var strTimestamp = "" + i;
				return "t" + strTimestamp;
			}
			// Function
			this.highlightCaptionAndPrepareForNext = function() {
				clearCurrentHighlighting();
				highlightNextCaption();
				currentCaptionIndex = nextCaptionIndex;
				nextCaptionIndex++;

				var currentTime = vid.currentTime;
				var timeoutValue = calculateTimeout(currentTime);

				if (nextCaptionIndex <= captions.length) {
					this.setCaptionTimeout(timeoutValue);
					//scroll tới chỗ đoạn script
					//vì chiều cao của mỗi đoạn script sẽ là 45px nên m = 45
					//có 12 phần tử hiển thị trên thanh nên đến phần tử thứ 7 mới scroll
					var m = 45;
					if (currentCaptionIndex > 6) {
						$('html, .mmocVideoTranscript').animate({
							scrollTop : m * (currentCaptionIndex - 5)
						}, 50);
					} else {//scroll ontop
						$('html, .mmocVideoTranscript').animate({
							scrollTop : 0
						}, 50);
					}
					//getStartTimeFromCaption(currentCaptionIndex)=>time

					pos = currentCaptionIndex;
				}
			}

			//Called if the user has dragged the slider to somewhere in the video.
			this.highlightCaptionFromTimestamp = function(timeStamp) {
				clearCurrentHighlighting();
				nextCaptionIndex = findCaptionIndexFromTimestamp(timeStamp);
				currentCaptionIndex = nextCaptionIndex;

				var startTime = Number(getStartTimeFromCaption(currentCaptionIndex));

				var timeoutValue = -1;
				if (timeStamp < startTime) {
					timeoutValue = startTime - currentTime;
				} else {
					highlightNextCaption();
					timeoutValue = calculateTimeout(currentTime);
				}
				this.setCaptionTimeout(timeoutValue);
				//scroll tới chỗ đoạn script
				var m = 45;
				if (currentCaptionIndex > 6) {
					$('html, .mmocVideoTranscript').animate({
						scrollTop : m * (currentCaptionIndex - 5)
					}, 50);
				} else {// scroll ontop
					$('html, .mmocVideoTranscript').animate({
						scrollTop : 0
					}, 50);
				}
				pos = currentCaptionIndex;
			}

			this.transcriptLoaded = function(transcript) {
				var start = 0;
				captions = transcript;
				//console.log(captions);
				src = captions;
				var srt_output = "";
                srt_output += "<div style='height: 7px'></div>";
                for (var i = 0, il = captions.length; i < il; i++) {
					start = +getStartTimeFromCaption(i);

					captionText = captions[i].text;
					var timestampId = getTimeIdFromTimestampIndex(i);
					// srt_output += "<span style='margin: 10px 0px 10px' class='btnSeek' data-seek='" + start + "' id='" + timestampId + "'>" + "<button style='margin-right: 5px;' class='clicknote btn btn-primary fa fa-edit' data-position='"+ i +"' data-seek='" + start + "'> Note</button>" +"<strong>"+ makeTimeline(start) +" - </strong>"+ captionText +"</span> ";
					var check = false;
					for(var j=0; j<arrnote.length; j++){
                        var positions = arrnote[j].pos;
                        if(positions == i){
                            check = true;
                            break;// nếu xuất hiện có thì dừng lại
                        }
                    }
					if (check) {
						srt_output += '<div class="grid-row" style=" height: 45px">'
								+ '<div class="col-sm-2">'
								+ '<button id="note'+i+'" data-target="#insertnote" data-toggle="modal" class="clicknote btn btn-danger fa fa-edit" data-position="'+ i +'" data-seek="'+ start +'"> Edit </button>'
								+ '</div>'
								+ '<div class="col-sm-9">'
								+ '<div class="btnSeek" data-seek="'+ start +'" id="'+ timestampId +'"><strong>'
								+ makeTimeline(start)
								+ ' - </strong>'
								+ captionText
								+ '</div>'
								+ '</div>'
								+ '<div class="col-sm-1">'
								+ '<a><i class="fa fa-eye" aria-hidden="true" id="show" data-pos="'+i+'"></i></a>'
								+ '</div>' + '</div>';
					} else {
						srt_output += '<div class="grid-row" style=" height: 45px">'
								+ '<div class="col-sm-2">'
								+ '<button id="note'+i+'" data-target="#insertnote" data-toggle="modal" class="clicknote btn btn-primary fa fa-edit" data-position="'+ i +'" data-seek="'+ start +'"> Note</button>'
								+ '</div>'
								+ '<div class="col-sm-9">'
								+ '<div class="btnSeek" data-seek="'+ start +'" id="'+ timestampId +'"><strong>'
								+ makeTimeline(start)
								+ ' - </strong>'
								+ captionText
								+ '</div>'
								+ '</div>'
								+ '<div class="col-sm-1">'
								+ '<a><i class="fa fa-eye" aria-hidden="true" id="show" data-pos="'+i+'"></i></a>'
								+ '</div>' + '</div>';
					}
				}
				;

				$("#videoTranscript").append(srt_output);
				captionsLoaded = true;
			}

			this.getTranscriptId = function() {
				return transcriptId;
			}

			this.getTranscript = function() {
				var oTranscript = this;
				//Read file .srt and convert to json
				$
						.ajax({
							url : linkhost + namesub,
							type : 'GET',
							data : {},
							success : function(response) {
								//tiến hành convert từ định dạnh srt sang json từ respone trả về
								var lines = response.split('\r\n');
								var output = [];
								var buffer = {
									id : '',
									start_time : '',
									end_time : '',
									text : ''
								};
								lines.forEach(function(line) {
									if (!buffer.id)
										buffer.id = line;
									else if (!buffer.start_time) {
										var range = line.split(' --> ');
										buffer.start_time = range[0];
										buffer.end_time = range[1];
									} else if (line !== '')
										buffer.text = line;
									else {
										output.push(buffer);
										buffer = {
											id : '',
											start_time : '',
											end_time : '',
											text : ''
										};
									}
								});
								oTranscript.transcriptLoaded(output);
							},
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								console.log("Error during GET");
							}
						});
			}
			vid.onpause = function() {
				video_status = false;
				if (!captionsLoaded) {
					return;
				}
				console.log('Video is paused!');
				clearTimeout(captionTimeout);
				clearInterval(intervalTimeOut);
			}
			var tran = this;
			vid.onplay = function() {
				video_status = true;
				if (!captionsLoaded) {
					return;
				}
				console.log('Video is played!');
				/* vid.ontimeupdate = function() {
					currentTime = vid.currentTime;
					tran.highlightCaptionFromTimestamp(currentTime);
				} */
				//when video play this request will send
				currentTime = vid.currentTime;
				tran.highlightCaptionFromTimestamp(currentTime);
				//set every 1s send 1 request
				intervalTimeOut =  setInterval(function(){
					currentTime = vid.currentTime;
					tran.highlightCaptionFromTimestamp(currentTime);
				}, 1000);
			}
		}
		
		//Called when user clicks somewhere in the transcript.
		$(function() {
			$(document).on('click', '.btnSeek', function() {
				var seekToTime = $(this).data('seek');
				vid.currentTime = seekToTime;
				vid.play();
			});
			$(document).on('click', '.clicknote', function() {
				// kiểm tra đăng nhập chưa?
				if(emailuser == null || emailuser == 'null'){
					alert('Please login!');
					$("#cancel").click();
					return false;
				}
	
				// kiểm tra đã lưu bài học chưa?
				var isSave = document.getElementById("savelesson").disabled;
				if(!isSave){
					$("#cancel").click();
					alert('Please save lesson before start note! Please click button "Save lesson"!');
					return false;
				}
	
		        var seekToTime = $(this).data('seek');
				vid.currentTime = seekToTime;// nhảy time video lại chỗ ghi chú
		        vid.pause();
		         pos = $(this).data('position');
		         var isExistCheck = false;
		         var posData;
		         for(var i = 0; i < arrnote.length; i++){
		         	if(arrnote[i].pos == pos){
		         		isExistCheck = true;
		         		posData = i;
		         		break;// thoát vòng lặp ngay và luôn đê =)))z
		         	}
		         }
		         if(isExistCheck){
		         	$("#add").html('Update');
		         	CKEDITOR.instances.editor1.setData(arrnote[posData].content);
	
		         }else{
		         	$("#add").html('Add');
		         	CKEDITOR.instances.editor1.setData("");
		         }
		     });
		     $(document).on('click', '#show', function() {
		         var po = $(this).data('pos');
		         $("#t"+po).popover('show');
		         vid.pause();
		     });
		});
		$(document).on('click', '#myVideo', function() {
			if (this.paused) {
				this.play();
			} else {
				this.pause();
			}
		});
	</script>
	
	<script>
		$("#getsub").click(function() {
			var url = $("input[name='getsub']").val();
			if(url.split("?v=").length > 1){
				var key = url.split("?v=")[1];
				var key2 = key.split("&")[0];
				window.location.href = "getsub?v=" + key2;
			}else{
				alert("Please enter the correct link format!");
			}
		});
		$("#savelesson").click(function(){
			if(emailuser == null || emailuser == 'null'){
				alert('Please login!');
				return false;
			}
		});
		$("#add_lesson").click(function(e){
			var title = $('#title_lesson').val();
			if(title.length == 0){
				alert("Please enter title!");
				return false;
			}
			console.log(emailuser);
			var lesson = {
					email: emailuser,
					title: title,
					idvideo: idvideo,
					linkimg: '',
					namesub: namesub
			}
			
			//post dữ liệu để lưu lesson
			$.post("savelesson", lesson).done(function(res){
				if(res == "ok"){
					$('#title_lesson').val('');
					alert('Save success!');
					document.getElementById("savelesson").disabled = true;// sau khi lưu thành công thì button sẽ bị ẩn
				}else{
					alert('Please try again!');	
				}
			});
		});
		$("#add").click(function(e){
			e.preventDefault();
			var text = CKEDITOR.instances.editor1.getData();
			if(text.length == 0){
				alert("Please enter note!");
				return false;
			}
			var note = {
					pos: pos,
					content: text,
					email: emailuser,
					idvideo: idvideo
			};
			$.post("addnote", note).done(function(res){
				if(res == 'ok'){
					$('#insertnote').modal('toggle');
					CKEDITOR.instances['editor1'].setData("");
					var id = 'note'+pos;
                    var element = document.getElementById(id);
                    element.classList.remove("btn-primary");
                    element.classList.add("btn-danger");
                    element.innerHTML = " Edit ";
                    
					//reset lại mảng chứa ghi chú
					var post = {
							idvideo: idvideo,
							email: emailuser
					};
					//get note arr
					$.post("getnote", post).done(function(res){
						console.log(res);
						arrnote = JSON.parse(res);
						var text = $("#add").text();
                        var p;
                        for(var a=0 ; a<arrnote.length; a++){
                            if(arrnote[a].pos == pos){
                                p = a;
                                break;
                            }
                        }
                        if(text == 'Update'){
                            var popover = $('#t'+pos).data('bs.popover');
                            popover.options.content = arrnote[p].content;
                            return false;// dừng lại
                        }
                        if(pos < 6){
                            $("#t"+pos).popover({
                                html: true,
                                title: '<center>Note<center><a class="close" data-position="'+pos+'" style="position: absolute; top: 0; right: 6px;" href="#");">&times;</a>',
                                content: arrnote[p].content,
                                trigger: "manual",
                                placement: "bottom"
                            });
                        }else{
                            $("#t"+pos).popover({
                                html: true,
                                title: '<center>Note<center><a class="close" data-position="'+pos+'" style="position: absolute; top: 0; right: 6px;" href="#");">&times;</a>',
                                content: arrnote[p].content,
                                trigger: "manual",
                                placement: "top"
                            });
                        }
					});
				}else{
					alert('Add or Edit note fail! Please try again!');
				}
			});
		});
		//ckeditor được khởi tạo
		CKEDITOR.replace('editor1');

		$(document).ready(function(){
			// vì hàm này chạy trước nên các biến toàn cục sẽ không hiểu vì thế get email bằng cách lấy cookie
			<%
				String cookie = MyUtils.getUserNameInCookie(request);	
			%>
			var post = {
					idvideo: idvideo,
					email: '<%=cookie%>'
			};
			//get note arr
			$.post("getnote", post).done(function(res){
				console.log(res);
				arrnote = JSON.parse(res);

				//init(khởi tạo transcript sau khi load xong ghi chú)
				var oTranscript = new transcript('videoTranscript');
				oTranscript.getTranscript();
			});
			//check lesson isSave
			var lesson = {
					email: '<%=cookie%>',
					idvideo: idvideo
			};
			$.post("checksavelesson", lesson).done(function(res){
				if(res == "ok"){
					document.getElementById("savelesson").disabled = true;//ẩn nút save nếu đã lưu bài trước đó
				}else{
					document.getElementById("savelesson").disabled = false;// hiện nút save nếu chưa lưu
				}
			});
		});
		
	</script>
</body>
</html>