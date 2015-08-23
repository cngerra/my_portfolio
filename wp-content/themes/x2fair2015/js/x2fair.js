function fixedbsmenu(){
    if(jQuery(window).width() < 604){
        //Static Top
        document.onscroll = function() {
            if( jQuery(window).scrollTop() > jQuery('header').height() ) {
                jQuery('nav#navigation').addClass('fixednav');
            }
            else {
                jQuery('nav#navigation').removeClass('fixednav');
            }
        };
    }
}

function fixedbsmenu767(){
    if(jQuery(window).width() > 700){
        //Static Top
        document.onscroll = function() {
            if( jQuery(window).scrollTop() > jQuery('header').height() ) {
                jQuery('.header_inner').addClass('nav_logo_wrapper');
                jQuery('.alternative_logo').show();
            } else {
                jQuery('.header_inner').removeClass('nav_logo_wrapper');
                jQuery('.alternative_logo').hide();
            }
        };
    }
}

function onLoadClick(){
    if(jQuery(window).width() > 700){
        //Static Top
        if( jQuery(window).scrollTop() > jQuery('header').height() ) {
            jQuery('.header_inner').addClass('nav_logo_wrapper');
            jQuery('.alternative_logo').show();
        } else {
            jQuery('.header_inner').removeClass('nav_logo_wrapper');
            jQuery('.alternative_logo').hide();
        }
    }
}

jQuery(document).ready(function() {

    jQuery(document.body).hide().fadeIn(1000);

    //Static Menu
    fixedbsmenu();
    fixedbsmenu767();
    onLoadClick();

    jQuery('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = jQuery(this.hash);
          target = target.length ? target : jQuery('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            jQuery('html,body').animate({scrollTop: target.offset().top}, 1000);
            return false;
          }
        }
    });

    jQuery('.post').addClass('hiddenAnimation').viewportChecker({
        classToAdd: 'visibleAnimation animated fadeIn',
        offset: 400
    });
    
    jQuery('#html, #css, #php, #jquery, #boostrap, #wordpress').circliful();

});

jQuery(window).resize(function() {
    fixedbsmenu();
    fixedbsmenu767();
});