var ready;
ready = function() {
  
  $('#close-button').on("click", function() {
    window.close();
  });
  
};

$(document).ready(ready);
$(document).on('page:load', ready);