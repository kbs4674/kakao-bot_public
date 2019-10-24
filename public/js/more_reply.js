$(function(){
    $(".more_comment_list").slice(0, 15).show(); // select the first ten
      $("#load_comment").click(function(e){ // click event for load more
      e.preventDefault();
      $(".more_comment_list:hidden").slice(0, 10).show(); // select next 10 hidden divs and show them
      if($(".more_comment_list:hidden").length == 0){ // check if any hidden divs still exist
        $("#load_comment").html('<div style="color: black; text-align: center"><h2><i class="fas fa-flag-checkered"></i></h2><div style="margin-top: 0px">댓글 Finish!</div></div>') // if there are none left
      }
    });
  });