<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="getsubyoutube.utils.*"%>
<!DOCTYPE html>
<!-- saved from url=(0073)https://academicapps.temple.edu/youtubeIT/ytitexample2.html?v=xianU0IrxEk -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
<script type="text/javascript" src="./ckeditor/ckeditor.js"> </script>

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
</head>
<body>
	<div class="container-fluid"
		style="padding: 0px !important;; margin: 0px !important;">

		<jsp:include page="_header_get.jsp"></jsp:include>

		<div class="ic-Layout-contentMain" style="margin-top: 70px; background-image: url('./images/background.jpg');">
			<div class="content-box" id="top_area">
				<div class="grid-row">
					<div class="col-xs-6">
						<div class="" style="margin-top: 15px" id="youTubeVideo">
							<iframe class="iframe" id="" src="" width="560" height="400"
								allow="autoplay" allowfullscreen="true" __idm_id__="1016238081"></iframe>
						</div>
						<div style="text-align: center; border-style: double" class="hidden">
							<p id="note" style="margin-top: 7px">Subtitle will be shown
								here!</p>
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
							style="margin-left: 120px;" data-dismiss="modal">Add</button>
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

	<!-- <script src="./JS&CSS/jquery.min.js"></script> -->
	<script src="./JS&CSS/urlObject.js"></script>

	<script>
	//1 số biến toàn cục
	var pos;
	var idvideo;
	var arrnote;
	var idtranscript;
    var src;
	
    var page_url = urlObject(window.location.href);
    ytvid = page_url.parameters.v || "Ux1iQBU09oA";
    lang = page_url.parameters.lang || "en";
    vname = page_url.parameters.name || "";
    
    idvideo = page_url.parameters.v;

    // change src video iframe
    var video_frame = $('.iframe')
        .attr("id", ytvid)
        .attr("src", "https://www.youtube.com/embed/" + ytvid + "?enablejsapi=1")
        .attr("width", 620)
        .attr("height", 570)
        .attr("allow", "autoplay")
        .attr("allowfullscreen", "true");
    // get script
    var transcript_div = $('.mmocVideoTranscript')
        .attr("id", "videoTranscript" + ytvid)
        .data('language', lang)
        .data('name', vname);
    idtranscript = "videoTranscript" + ytvid;

    // $("#youTubeVideo").append(video_frame);
    //$("#transcript").append(transcript_div);

    $(function(){
        var windowH = $(window).height();
        var wrapperH = $('.mmocVideoTranscript').height();
        if(windowH > wrapperH) {
            $('.mmocVideoTranscript').css({'height':($(window).height()-150)+'px'});
        }
        $(window).resize(function(){
            var windowH = $(window).height();
            var wrapperH = $('.mmocVideoTranscript').height();
            if(windowH > wrapperH) {
                $('.mmocVideoTranscript').css({'height':($(window).height()-150)+'px'});
            }

        })
    });
</script>

	<script>
    this.mmooc=this.mmooc||{};

    //https://medium.com/@pointbmusic/youtube-api-checklist-c195e9abaff1
    this.mmooc.youtube = function() {
        var hrefPrefix = "https://video.google.com/timedtext?v=";
        var transcriptIdPrefix = "videoTranscript";
        var transcriptArr = [];
        var initialized = false;

        //tính thời gian
        function makeTimeline (time) {
            var string, time_array = [];

            time_array.push(Math.floor(time / (60 * 60)));
            time_array.push(Math.floor((time - (time_array[0] * 60 * 60)) / 60));
            time_array.push(Math.floor(time - ((time_array[1] * 60) + (time_array[0] * 60 * 60))));

            for (var i = 0, il = time_array.length; i < il; i++) {
                string = '' + time_array[i];
                if (1 === string.length) {
                    time_array[i] = '0' + string;
                }
            }
            return time_array.join(':');
        };

        function transcript(transcriptId, language, name)
        {
            var transcriptId = transcriptId;
            var videoId = transcriptId.split(transcriptIdPrefix)[1];

            var href = hrefPrefix + videoId;
            if(language != "")
            {
               href = href + "&lang=" + language;
            }
            if(name != "")
            {
              href = href + "&name=" + name;
            }

            //Array of captions in video
            var captionsLoaded = false;

            //Timeout for next caption
            var captionTimeout = null;
            
            var captions = null;

            //Keep track of which captions we are showing
            var currentCaptionIndex = 0;
            var nextCaptionIndex = 0;

            this.player = new YT.Player(videoId, {
              videoId: videoId,
              events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
              }
            });
            
            var findCaptionIndexFromTimestamp = function(timeStamp)
            {
                var start = 0;
                var duration = 0;
                for (var i = 0, il = captions.length; i < il; i++) {
                    start = Number(getStartTimeFromCaption(i));
                    duration = Number(getDurationFromCaption(i));
        
                    //Return the first caption if the timeStamp is smaller than the first caption start time.
                    if(timeStamp < start)
                    {
                        break;
                    }
        
                    //Check if the timestamp is in the interval of this caption.
                    if((timeStamp >= start) && (timeStamp < (start + duration)))
                    {
                        break;
                    }        
                }
                return i;
            }
            var clearCurrentHighlighting = function()
            {   
                var timeStampId = getTimeIdFromTimestampIndex(currentCaptionIndex);
                $("#"+timeStampId).css('background-color', '');
                for(var i=0; i<src.length; i++){
                    $("#t"+i).popover('hide');
                }
            }

            var highlightNextCaption = function ()
            {
                var timestampId = getTimeIdFromTimestampIndex(nextCaptionIndex);
                $("#"+timestampId).css('background-color', 'yellow');
            }

            var calculateTimeout = function (currentTime)
            {
                var startTime = Number(getStartTimeFromCaption(currentCaptionIndex));
                var duration = Number(getDurationFromCaption(currentCaptionIndex));
                var timeoutValue = startTime - currentTime + duration;
                return timeoutValue;
            }

            this.setCaptionTimeout = function (timeoutValue)
            {
                if(timeoutValue < 0)
                {
                    return;
                }
                
                clearTimeout(captionTimeout);
                
                var transcript = this;
                
                captionTimeout = setTimeout(function() {
                    transcript.highlightCaptionAndPrepareForNext();
                }, timeoutValue*1000);
            }

            var getStartTimeFromCaption = function(i)
            {
                if(i >= captions.length)
                {
                    return -1;
                }
                return captions[i].getAttribute('start');
            }
            var getDurationFromCaption = function(i) 
            {
                if(i >= captions.length)
                {
                    return -1;
                }
                return captions[i].getAttribute('dur');
            }
            var getTimeIdFromTimestampIndex = function(i)
            {
                var strTimestamp = "" + i;
                return "t" + strTimestamp;
            }


            //////////////////
            //Public functions
            /////////////////

            //This function highlights the next caption in the list and
            //sets a timeout for the next one after that.
            //It must be public as it is called from a timer.
            this.highlightCaptionAndPrepareForNext = function ()
            {
                clearCurrentHighlighting();
                highlightNextCaption();
                currentCaptionIndex = nextCaptionIndex;
                nextCaptionIndex++;

                var currentTime = this.player.getCurrentTime();
                var timeoutValue = calculateTimeout(currentTime);
            
                if(nextCaptionIndex <= captions.length)         
                {
                    this.setCaptionTimeout(timeoutValue);
                    //scroll tới chỗ đoạn script
                    //vì chiều cao của mỗi đoạn script sẽ là 45px nên m = 45
                    //có 12 phần tử hiển thị trên thanh nên đến phần tử thứ 7 mới scroll
                    var m = 45;
                    if(currentCaptionIndex > 6){
                        $('html, .mmocVideoTranscript').animate({ scrollTop: m*(currentCaptionIndex-5) }, 50);
                    }else{//scroll ontop
                        $('html, .mmocVideoTranscript').animate({ scrollTop: 0}, 50);
                    }
                    //getStartTimeFromCaption(currentCaptionIndex)=>time
                    
               		pos = currentCaptionIndex;
                }
            }
            
            //Called if the user has dragged the slider to somewhere in the video.
            this.highlightCaptionFromTimestamp = function(timeStamp)
            {
                clearCurrentHighlighting();
                nextCaptionIndex = findCaptionIndexFromTimestamp(timeStamp);
                currentCaptionIndex = nextCaptionIndex;

                var startTime = Number(getStartTimeFromCaption(currentCaptionIndex));

                var timeoutValue = -1;      
                if(timeStamp < startTime)
                {
                    timeoutValue = startTime - currentTime;
                }
                else
                {
                    highlightNextCaption();
                    timeoutValue = calculateTimeout(currentTime);
                }
                this.setCaptionTimeout(timeoutValue);
                //scroll tới chỗ đoạn script
                var m = 45;
                if(currentCaptionIndex > 6){
                    $('html, .mmocVideoTranscript').animate({ scrollTop: m*(currentCaptionIndex-5) }, 50);
                }else{// scroll ontop
                    $('html, .mmocVideoTranscript').animate({ scrollTop: 0}, 50);
                }
                pos = currentCaptionIndex;
            }   

            this.transcriptLoaded = function(transcript) {
                var start = 0;
                captions = transcript.getElementsByTagName('text');
                src = captions;
                var srt_output="";
                srt_output += "<div><div style='text-align: center;'><div class='btnSeek fa fa-play btn btn-default' style=' height: 35px' id='btnSeek' data-seek='0'>Play(<strong>00:00:00</strong>)</div></div></div>";
                for (var i = 0, il = captions.length; i < il; i++) {
                    start =+ getStartTimeFromCaption(i);

                    captionText = captions[i].textContent.replace(/</g, '&lt;').replace(/>/g, '&gt;');
                    var timestampId = getTimeIdFromTimestampIndex(i);
                    // srt_output += "<span style='margin: 10px 0px 10px' class='btnSeek' data-seek='" + start + "' id='" + timestampId + "'>" + "<button style='margin-right: 5px;' class='clicknote btn btn-primary fa fa-edit' data-position='"+ i +"' data-seek='" + start + "'> Note</button>" +"<strong>"+ makeTimeline(start) +" - </strong>"+ captionText +"</span> ";
                    var check = false;
                    for(var j=0; j<arrnote.length; j++){
                        var positions = arrnote[j].pos;
                        if(positions == i){
                            check = true;
                        }
                    }
                    if(check){
                        srt_output += 
                        '<div class="grid-row" style=" height: 45px">'+
                            '<div class="col-sm-2">'+
                                '<button id="note'+i+'" data-target="#insertnote" data-toggle="modal" class="clicknote btn btn-danger fa fa-edit" data-position="'+ i +'" data-seek="'+ start +'"> Edit </button>'+
                            '</div>'+
                            '<div class="col-sm-9">'+
                                '<div class="btnSeek" data-seek="'+ start +'" id="'+ timestampId +'"><strong>'+ makeTimeline(start) +' - </strong>'+ captionText +'</div>'+
                            '</div>'+
                            '<div class="col-sm-1">'+
                                '<a><i class="fa fa-eye" aria-hidden="true" id="show" data-pos="'+i+'"></i></a>'+
                            '</div>'+
                        '</div>';
                    }else{
                        srt_output += 
                        '<div class="grid-row" style=" height: 45px">'+
                            '<div class="col-sm-2">'+
                                '<button id="note'+i+'" data-target="#insertnote" data-toggle="modal" class="clicknote btn btn-primary fa fa-edit" data-position="'+ i +'" data-seek="'+ start +'"> Note</button>'+
                            '</div>'+
                            '<div class="col-sm-9">'+
                                '<div class="btnSeek" data-seek="'+ start +'" id="'+ timestampId +'"><strong>'+ makeTimeline(start) +' - </strong>'+ captionText +'</div>'+
                            '</div>'+
                            '<div class="col-sm-1">'+
                                '<a><i class="fa fa-eye" aria-hidden="true" id="show" data-pos="'+i+'"></i></a>'+
                            '</div>'+
                        '</div>';
                    }
                };

                $("#videoTranscript" + videoId).append(srt_output);
                captionsLoaded = true;
            }
            
            this.getTranscriptId = function()
            {
                return transcriptId;
            }
            this.getVideoId = function()
            {
                return videoId;
            }
            
            this.getTranscript = function()
            {
                var oTranscript = this;
                console.log(href);
                $.ajax({
                    url: href,
                    type: 'GET',
                    data: {},
                    success: function(response) {
                        if(response === '' || response === null){// nếu response trả về là null
                            
                            // đổi từ chuẩn US sang UK
                            var po = href.indexOf('lang');
                            var temp = href.slice(0, po);
                            temp = temp + 'lang=en-GB';// chuẩn vương quốc anh
                            href = temp;
                            //oTranscript.getTranscript();
                            $.ajax({
                                url: href,
                                type: 'GET',
                                data: {},
                                success: function(res) {
                                    if(res === '' || res === null){// đối với bản dịch tự động sẽ không lấy được dữ liệu 
                                        alert('An error accurred. Please try other link!');
                                        return true;
                                    }else{
                                        oTranscript.transcriptLoaded(res);
                                    }
                                },
                                error: function(XMLHttpRequest, textStatus, errorThrown) {
                                    console.log("Error during GET");
                                }
                            });
                        }
                        else{
                            oTranscript.transcriptLoaded(response);
                        }
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        console.log("Error during GET");
                    }
                });           
            }
            
            this.playerPlaying = function()
            {
                if(!captionsLoaded)
                {
                    return;
                }   
                
                currentTime = this.player.getCurrentTime();
                this.highlightCaptionFromTimestamp(currentTime);
            }
            this.playerNotPlaying = function (transcript)
            {
                if(!captionsLoaded)
                {
                    return;
                }   
                clearTimeout(captionTimeout);
            }
        }

        //Called when user clicks somewhere in the transcript.
        $(function() {
            $(document).on('click', '.btnSeek', function() {
                var seekToTime = $(this).data('seek');
                var transcript = mmooc.youtube.getTranscriptFromTranscriptId($(this).parent().parent().parent().attr("id"));
                transcript.player.seekTo(seekToTime, true);
                transcript.player.playVideo();
            });
            $(document).on('click', '.clicknote', function() {
				// kiểm tra đăng nhập chưa?
                if(emailuser == null || emailuser == 'null'){
                	alert('Please login!');
                	$("#insertnote").modal('toggle');
                	return false;
                }
				
				// kiểm tra đã lưu bài học chưa?
                var isSave = document.getElementById("savelesson").disabled;
                if(!isSave){
                	$("#insertnote").modal('toggle');
                	alert('Please save lesson before start note! Please click button "Save lesson"!');
                	return false;
                }

                var transcript = mmooc.youtube.getTranscriptFromTranscriptId($(this).parent().parent().parent().attr("id"));
                //transcript.player.playVideo();
                var seekToTime = $(this).data('seek');
                //transcript.player.playVideo();
                transcript.player.seekTo(seekToTime, true);// nhảy time video lại chỗ ghi chú
                transcript.player.pauseVideo();
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
                //document.getElementById('note').innerHTML = src[pos].textContent.replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/&#39;/g, "'").replace(/&amp;/g, "&");
                //alert(src[pos].textContent.replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/&#39;/g, "'").replace(/&amp;/g, "&"));
            });
            $(document).on('click', '#show', function() {
                var video = mmooc.youtube.getTranscriptFromTranscriptId(idtranscript);
                video.player.pauseVideo();
                var pos = $(this).data('pos');
                $("#t"+pos).popover('show');
            });
        });

        //These functions must be global as YouTube API will call them. 
        var previousOnYouTubePlayerAPIReady = window.onYouTubePlayerAPIReady; 
        window.onYouTubePlayerAPIReady = function() {
            if(previousOnYouTubePlayerAPIReady)
            {
                previousOnYouTubePlayerAPIReady();
            }
            mmooc.youtube.APIReady();
        };

        // The API will call this function when the video player is ready.
        // It can be used to auto start the video f.ex.
        window.onPlayerReady = function(event) {
        }

        // The API calls this function when the player's state changes.
        //    The function indicates that when playing a video (state=1),
        //    the player should play for six seconds and then stop.
        window.onPlayerStateChange = function(event) {
            console.log("onPlayerStateChange " + event.data);
            var transcript = this.mmooc.youtube.getTranscriptFromVideoId(event.target.getIframe().id);
            if (event.data == YT.PlayerState.PLAYING) {
                transcript.playerPlaying();
            }
            else
            {
                transcript.playerNotPlaying();
            }
        }

        return {
            getTranscriptFromTranscriptId(transcriptId)
            {
                for (index = 0; index < transcriptArr.length; ++index) {
                    if(transcriptArr[index].getTranscriptId() == transcriptId)
                    {
                        return transcriptArr[index];
                    }
                }
                return null;
            },
            getTranscriptFromVideoId(videoId)
            {
                for (index = 0; index < transcriptArr.length; ++index) {
                    if(transcriptArr[index].getVideoId() == videoId)
                    {
                        return transcriptArr[index];
                    }
                }
                return null;
            },
            
            APIReady : function ()
            {
                if(!initialized)
                {
                    $(".mmocVideoTranscript" ).each(function( i ) {
                        var language = $(this).data('language');
                        var name = $(this).data('name');
                        var oTranscript = new transcript(this.id, language, name);
                        oTranscript.getTranscript();
                        transcriptArr.push(oTranscript);
                    });
                    initialized = true;
                }
            },
            init : function ()
            {
                this.APIReady();
            }       
        }

    }();
    //Everything is ready, load the youtube iframe_api
    $.getScript("https://www.youtube.com/iframe_api");



</script>
	<script type="text/javascript">
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
				//$("#titlelesson").modal('toggle');
				return false;
			}
		});
		$("#add_lesson").click(function(e){
			var linkimg = 'https://img.youtube.com/vi/'+idvideo+'/0.jpg';
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
					linkimg: linkimg,
					namesub: ''
			}
			
			//post dữ liệu để lưu lesson
			$.post("savelesson", lesson).done(function(res){
				if(res == "ok"){
					$('#title_lesson').val('');
					alert('Save success!');
					document.getElementById("savelesson").disabled = true;
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
		
		//ckeditor
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