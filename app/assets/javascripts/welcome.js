$(document).ready(function() {
  /*Carousel*/
  $("#work-carousel").carousel({interval: 5000});

  /*ScrollSpy*/
  $('body').scrollspy({target: "#site-nav", offset: 50});

  //When using scrollspy in conjunction with adding or
  //removing of elements from the DOM*/
  $('[data-spy="scroll"]').each(function () {
    var $spy = $(this).scrollspy('refresh')
  });

	$('#site-nav a').click(function(){
		//Toggle Class
		$(".active").removeClass("active");
		$(this).closest('li').addClass("active");
		var theClass = $(this).attr("class");
		$('.'+theClass).parent('li').addClass('active');
		//Animate
		$('html, body').stop().animate({
				scrollTop: $( $(this).attr('href') ).offset().top
		}, 800);
		return false;
	});
	$('.scrollTop a').scrollTop();
});
