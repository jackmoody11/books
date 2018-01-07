// Home scroll function
$(document).ready(function() {
	$('a[rel="relanchor"]').on("click",function(){
	    $('html, body').animate({
	        scrollTop: $( $.attr(this, 'href') ).offset().top
	    }, 500);
	    return false;
	});
});

// First round prevention of double submission
$('form').submit(function(){
    $('input[type=submit]', this).attr('disabled', 'disabled');
});
