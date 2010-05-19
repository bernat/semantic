$(document).ready(function() { 
    $("#sidebar a[title]").tooltip({tip: '#tooltip', effect: 'bouncy'});

		$('#comment_now').click(function() {
			$('#form_comentaris').fadeIn();
			$('#comment_now').hide();
		});
		
		$('#tanca').click(function() {
			$('#form_comentaris').fadeOut();
			$('#comment_now').fadeIn();
		});
		
});

$.easing.bouncy = function (x, t, b, c, d) { 
    var s = 1.70158; 
    if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b; 
    return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b; 
}

$.tools.tooltip.addEffect("bouncy", 
 
    // opening animation 
    function(done) { 
        this.getTip().animate({top: '+=15'}, 500, 'bouncy', done).show(); 
    }, 
 
    // closing animation 
    function(done) { 
        this.getTip().animate({top: '-=15'}, 500, 'bouncy', function()  { 
            $(this).hide(); 
            done.call(); 
        }); 
    } 
);


// /* Overlays */
// 
// // execute your scripts when the DOM is ready. this is a good habit 
// $(function() { 
//  
//     // assign a click event to the exposed element, using normal jQuery coding 
//     $("#presentationbox").mouseover(function() { 
// 
//         // perform exposing for the clicked element 
//         api1 = $(this).expose({api: true}).load(); 				
// 				api1.close().delay(500);
//     }); 
// });
// 
// $(function() { 
//  
//     // assign a click event to the exposed element, using normal jQuery coding 
//     $("#episodes").mouseover(function() { 
//  
// 			  // perform exposing for the clicked element 
//         api2 = $(this).expose({api: true}).load(); 
// 				api2.close().delay(500);
//     }); 
// });
