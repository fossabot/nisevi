$(document).ready(function() {

  /*==================Navigation Functions==================*/
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

  /*==================Header Functions==================*/
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

  /*==================Portfolio==================*/
  $("#work-slide").owlCarousel({
      // Most important owl features
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

  /*==================ScrollTo Links==================*/
  $('a.scrollto').click(function(e){
    $('html,body').scrollTo(this.hash, this.hash, {gap:{y:-50},animation:  {easing: 'easeInOutCubic', duration: 1600}});
    e.preventDefault();

    if ($('.navbar-collapse').hasClass('in')){
      $('.navbar-collapse').removeClass('in').addClass('collapse');
    }
  });


  /*==================Scrolling Animations==================*/
  $('.scrollimation').waypoint(function(){
    $(this).addClass('in');
  },{offset:function(){
      var h = $(window).height();
      var elemh = $(this).outerHeight();
      if ( elemh > h*0.3){
        return h*0.7;
      }else{
        return h - elemh;
      }
    }
  });

  /*==================Resize Functions==================*/
  $(window).resize(function(){
    scrollSpyRefresh();
    waypointsRefresh();
  });

  /*==================Refresh scrollSpy function==================*/
  function scrollSpyRefresh(){
    setTimeout(function(){
      $('body').scrollspy('refresh');
    },1000);
  }

  /*==================Refresh waypoints function==================*/
  function waypointsRefresh(){
    setTimeout(function(){
      $.waypoints('refresh');
    },1000);
  }

  //Back to Top
  //Check to see if the window is top if not then display button
  $(window).scroll(function(){
    if ($(this).scrollTop() > 800) {
      $('.scrollToTop').fadeIn();
    } else {
      $('.scrollToTop').fadeOut();
    }
  });
  
  //Click event to scroll to top
  $('.scrollToTop').click(function(){
    $('html, body').animate({scrollTop : 0},800);
    return false;
  });

  //MAGNIFIC POPUP
  $('.show-image').magnificPopup({type: 'image'});
});

/*==================WOW plugin triggers animate.css on scroll==================*/
var wow = new WOW(
  {
    boxClass: 'wow', // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset: 100, // distance to the element when triggering the animation (default is 0)
    mobile: false // trigger animations on mobile devices (true is default)
  }
);
wow.init();