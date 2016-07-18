$(document).ready(function() {
	/*Navigation Functions*/
	if ($(window).scrollTop()===0){
		$('#main-nav').removeClass('scrolled');
	}
	else{
		$('#main-nav').addClass('scrolled');
	}

	$(window).scroll(function(){
		if ($(window).scrollTop()===0){
			$('#main-nav').removeClass('scrolled');
		}
		else{
			$('#main-nav').addClass('scrolled');
		}
	});

	/*Header Functions*/
	$('.imac-screen').flexslider({
		prevText: '<i class="fa fa-angle-left"></i>',
		nextText: '<i class="fa fa-angle-right"></i>',
		animation: 'slide',
		slideshowSpeed: 3000,
		useCSS: true,
		controlNav: false,
		directionNav: false,
		pauseOnAction: false,
		pauseOnHover: false,
		smoothHeight: false
	});

	$("#home .text-col h1").fitText(0.9, { minFontSize: '38px', maxFontSize: '63px' });
	$("#home .text-col p").fitText(1.2, { minFontSize: '18px', maxFontSize: '32px' });

	if($('#home .imac-screen').length){
		$('.imac-screen img').load(function(){
			$('#home .text-col h1, #home .text-col p, #home .imac-frame').addClass('in');
		});
	}else{
		$('#home .text-col h1, #home .text-col p').addClass('in');
	}

  /*Resize Functions*/
	$(window).resize(function(){
		scrollSpyRefresh();
		waypointsRefresh();
	});

	/*Refresh scrollSpy function*/
  function scrollSpyRefresh(){
		setTimeout(function(){
			$('body').scrollspy('refresh');
		},1000);
	}

	/*Refresh waypoints function*/
	function waypointsRefresh(){
		setTimeout(function(){
			$.waypoints('refresh');
		},1000);
	}

	/*Caoursel*/
	$("#work-slide").owlCarousel({
			items: 1,
			itemsCustom: false,
			itemsDesktop: [1199, 1],
			itemsDesktopSmall: [980, 1],
			itemsTablet: [768, 1],
			itemsTabletSmall: false,
			itemsMobile: [479, 1],
			singleItem: false,
			startDragging: true,
			autoPlay: true
	});
});
