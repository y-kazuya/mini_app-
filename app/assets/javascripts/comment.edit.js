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

  
  $(".comment").on("submit", function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var textarea = $("#autocomplete-input")
    var text = textarea.val() //取得データ
    var numberarea = $(".edit--comment--score")
    var score = numberarea.val() //取得データ
    $.ajax({
      url: url,
      type: "PATCH",
      data: {
        comment: {
          text: text ,
          score: score,
        }
      },
      dataType: 'json',
    })
    .done(function(data) {
      console.log("oi")
      $(".edit--btn").next().css("display", "none")
      $("#submit--bottun").prop("disabled", false);
      $(".edit--btn").show(1000)
      $(".comment").find(".edit--comment--text").css("display", "none");
      $(".comment").find("#text").text(data.text)
      $(".comment").find("#text").show();
      $(".comment").find(".edit--comment--score").css("display", "none");
      $(".comment").find("#comment-score").text(data.score)
      $(".comment").find("#comment-score").show();






      
    })
    .fail(function() {
      alert('error');
    });
  })

});