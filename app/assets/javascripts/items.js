var ready;
ready = function() {

  var imgHeight = $("#item-image > div > img").height() + 5 + "px";

  $("#item-image").height(imgHeight);
  $("#item-image").flip();
  
  $("img").lazyload({
    effect : "fadeIn",
    effectspeed : 900
  });
  
};

$(document).ready(ready);
$(document).on('page:load', ready);
