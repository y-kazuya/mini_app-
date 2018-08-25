$(function(){

  $(".edit--btn").on("click", function(){
    var $comment = $(this).parents(".comment");  //クリックしたカードの全て
    var $score = $comment.find("#comment-score"); //カードのスコア
    var $text = $comment.find("#text");  //カードの本文
    var $bottun = $(this);
    console.log($comment);
    $score.hide();
    $comment.find(".edit--comment--score").css("display", "inline-block")
    $text.hide();
    $comment.find(".edit--comment--text").css("display", "block");
    $comment.find("#comment-score").hide();
    $bottun.hide();
    $bottun.next().css("display", "inline-block");
  });

  
});