/*!
 * Aggro website v1.0.0
*/

var Site = (function(){
  // Private
  var masonryOptions = { 
    itemSelector: ".feed-item", 
    columnWidth: 160,
    animate: true
  };
  
  function checkForMobile(){
    if(screen.width <= 480){
      // Add meta viewport tag
      var viewport = $('<meta />');
      viewport.attr({
        name:"viewport",
        content:"width=device-width, maximum-scale=1.0"
      });
      $("head").append(viewport);
      // Disable masonry animation
      masonryOptions.animate = false;
    }
  };
  
  function relativeTime(time_value){
    var values = time_value.split(" ");
    // Oct 30 2010 06:48:08
    time_value = values[0] + " " + values[1] + ", " + values[2] + " " + values[3];
    var parsed_date = Date.parse(time_value);
    var relative_to = (arguments.length > 1) ? arguments[1]:new Date();
    var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
    delta = delta + (relative_to.getTimezoneOffset() * 60);
    if (delta < 60){
      return 'less than a minute ago';
    } else if(delta < 120){
      return 'about a minute ago';
    } else if(delta < (60*60)){
      return (parseInt(delta / 60)).toString() + ' minutes ago';
    } else if(delta < (120*60)){
      return 'about an hour ago';
    } else if(delta < (24*60*60)){
      return 'about ' + (parseInt(delta / 3600)).toString() + ' hours ago';
    } else if(delta < (48*60*60)){
      return '1 day ago';
    } else {
      return (parseInt(delta / 86400)).toString() + ' days ago';
    }
  };
  
  function setCorners(radius, selector) {
    var settings = {
      tl: { radius: radius },
      tr: { radius: radius },
      bl: { radius: radius },
      br: { radius: radius },
      antiAlias: true
    }
    curvyCorners(settings, selector);
  };
  
  // Public
  return {
    
    init:function(){
      checkForMobile();
      $("div#feed-items .date").each(function(index) {
        $(this).text(relativeTime($(this).text()));
      });
      $("div#feed-items").masonry(masonryOptions);
    },
    
    roundedTags:function(){
      setCorners(5, "#tags a");
    },
    
    checkHeights:function(){
//      var navHeight = $('#navigation').height();
//      var screenHeight = $(window).height();
    }
    
  }
})();

//var iPhone = {
//  updateOrientation:function(){
//    if(window.orientation != null){
//	    var orientation = window.orientation;
//	    switch(orientation){
//		    case 0:
//				    document.body.setAttribute("class","portrait");
//				    break;	
//		    case 90:
//				    document.body.setAttribute("class","landscape");
//				    break;
//		    case -90:	
//				    document.body.setAttribute("class","landscape");
//				    break;
//	    }
//	  }
//  }
//}

//window.onload=iPhone.updateOrientation;
//window.onorientationchange=iPhone.updateOrientation;
