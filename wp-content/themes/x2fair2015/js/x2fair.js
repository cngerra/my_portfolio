function fixedbsmenu(){
    if($(window).width() < 604){
        //Static Top
        document.onscroll = function() {
            if( $(window).scrollTop() > $('header').height() ) {
                $('nav#navigation').addClass('fixednav');
            }
            else {
                $('nav#navigation').removeClass('fixednav');
            }
        };
    }
}

function fixedbsmenu767(){
    if($(window).width() > 700){
        //Static Top
        document.onscroll = function() {
            if( $(window).scrollTop() > $('header').height() ) {
                $('.header_inner').addClass('nav_logo_wrapper');
                //$('.logo').hide();
                $('.alternative_logo').show();
                //$('.logo_wrapper').css({'top':'30px'});
            }
            else {
                $('.header_inner').removeClass('nav_logo_wrapper');
                //$('.logo').show();
                $('.alternative_logo').hide();
                //$('.logo_wrapper').css({'top':'100px'});
            }
        };
    }
}

$(document).ready(function() {

    $(document.body).hide().fadeIn(1000);

    //Static Menu
    fixedbsmenu();
    fixedbsmenu767();

    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({scrollTop: target.offset().top}, 1000);
            return false;
          }
        }
    });

});

$(window).resize(function() {
    fixedbsmenu();
    fixedbsmenu767();
});