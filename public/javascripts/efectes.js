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
		
		/* Banner novetats */
		numFeeds = 7;
		rand = Math.ceil(Math.random() * numFeeds);

		initialize();
		setInterval(function () {
					$("#feeds").fadeOut("slow").delay(100);
					setTimeout(function() { initialize(); }, 500);
					$("#feeds").delay(100).fadeIn("slow");
								
	   }, 6000); 
	
});

$.easing.bouncy = function (x, t, b, c, d) { 
    var s = 5; 
    if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b; 
    return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b; 
}

$.tools.tooltip.addEffect("bouncy", 
 
    // opening animation 
    function(done) { 
        this.getTip().animate({top: '+=5'}, 500, 'bouncy', done).show(); 
    }, 
 
    // closing animation 
    function(done) { 
        this.getTip().animate({top: '-=5'}, 500, 'bouncy', function()  { 
            $(this).hide(); 
            done.call(); 
        }); 
    } 
);


/* Barra novetats */

var rand;
var numFeeds;

function initialize() 
{
   var feedControl = new google.feeds.FeedControl();
   feedControl.setNumEntries(1);

   switch(rand)
   {
      case 1:
        feedControl.addFeed("http://twitter.com/statuses/user_timeline/147278409.rss", "Twitter Semàntic");
        break;
      case 2:
        feedControl.addFeed("http://feeds.feedburner.com/bernatfarrero", "Bernat Farrero blog");
        break;
			case 3:
				feedControl.addFeed("http://feeds.feedburner.com/JROM", "Jordi Romero blog");
				break;
			case 4: 
				feedControl.addFeed("http://feeds.feedburner.com/Nigeka", "Masumi Mutsuda blog");
				break;
			case 5:
				feedControl.addFeed("http://twitter.com/statuses/user_timeline/16133642.rss", "Twitter Mutsuda");
				break;
			case 6:
				feedControl.addFeed("http://twitter.com/statuses/user_timeline/14269090.rss", "Twitter Jordi");
				break;
      default:
        feedControl.addFeed("http://twitter.com/statuses/user_timeline/88408309.rss", "Twitter Bernat");
    }

    feedControl.draw(document.getElementById("feeds"));
		rand = (rand + 1) % numFeeds;
  }




