// Home scroll function
$(document).ready(function() {
	$('a[rel="relanchor"]').on("click",function(){
	    $('html, body').animate({
	        scrollTop: $( $.attr(this, 'href') ).offset().top
	    }, 500);
	    return false;
	});
});
