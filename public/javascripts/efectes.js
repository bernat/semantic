$(document).ready(function() { 
    $("#sidebar a[title]").tooltip({tip: '#tooltip', effect: 'bouncy'});
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