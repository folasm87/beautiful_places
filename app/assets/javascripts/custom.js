$(document).ready(function($) {
	//$('ul.tabs li').click(function() {
	$(document).on('click', 'ul.tabs li', function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');

	});

	//$(".fancybox").fancybox();
	$(".fancybox").fancybox({
		openEffect : 'none',
		closeEffect : 'none',
		iframe : {
			preload : false
		}
	});
	$(".various").fancybox({
		maxWidth : 800,
		maxHeight : 600,
		fitToView : false,
		width : '70%',
		height : '70%',
		autoSize : false,
		closeClick : false,
		openEffect : 'none',
		closeEffect : 'none'
	});
	
	$(".fancybox")
    .attr('rel', 'gallery')
    .fancybox({
        openEffect  : 'none',
        closeEffect : 'none',
        nextEffect  : 'none',
        prevEffect  : 'none',
        padding     : 0,
        margin      : [20, 60, 20, 60] // Increase left/right margin
    });
});
