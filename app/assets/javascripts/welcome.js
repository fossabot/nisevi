$(document).ready(function() {
  /*ScrollSpy*/
  $('body').scrollspy({target: "#site-nav", offset: 50});

  //When using scrollspy in conjunction with adding or
  //removing of elements from the DOM*/
  $('[data-spy="scroll"]').each(function () {
    var $spy = $(this).scrollspy('refresh')
  });

	$('#site-nav a').click(function(){
		//Toggle Class
		$(this).removeClass("active");
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

  /*Carousel*/
  $(".carousel").carousel({interval: 3000});
});
