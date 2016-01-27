var ready = false;
$(document).ready(function() {
	ready = true;
	$(".main").css('margin-top', ($(window).height() - $('.main').outerHeight()) / 3 + $(document).scrollTop() + "px");
	$("#qrbtn").click(function(event) {
		openCamera();
		if ($(".con").length > 0) {
			$(".con").remove();
		}
	});
	$("h1").click(function(event) {
		alert("test");
	});
});

function openCamera() {
	$("#msframe").attr('src', 'camera/click');
	// return true;
}

function test()
{
	alert("hello");
}

function checkresult(res, id) {
	if (id == 1) {
		$("h4").after("<p class='con'>" + "扫描到的网址为：" + "</p>" + "<a class='con' href='" + res + "'>" + res + "</a>");

	} else {
		$("h4").after("<p class='con'>" + "扫描到的信息为：" + "</p>" + "<p>" + res + "</p");
	}
	return true;
}