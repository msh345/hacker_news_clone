$(document).ready(function() {
  $(".arrow").on('click', function(){ 
  	if ($(".navbar").data("session-id") != '') {
  	  $(this).attr("src", "/orange_arrow.png");
  	  var post_id = $(this).next().data("post-id");
  	  var url = "/post/" + post_id + "/vote";
  	  $.post(url);
    }
    else {
      window.location.replace('/login');    
    }
  });
});
