$(function(){
  var $setting_menu = $(".collapsible");
  var $sub_menu = $(".sub_menu")
  var $sub_menu_content = $(".sub_menu_content")

  $("#setting_bottun").on("click", function(){
    $setting_menu.fadeToggle();
    $().on("click", function(){
      $setting_menu.css("display", "none");
    });
    
    $sub_menu.on("click", function(){
      $(this).next().slideToggle(200);
      $(this).toggleClass("after_sub_menu")
      
      if($(this).find(".badge").hasClass("active")){
        $(this).find(".badge").removeClass("active");
        }
      else{
        $(this).find(".badge").addClass("active");
      }
    });
  });
  
  var $radio_color = $("input[name='group1']:checked").val()
  switch($radio_color){
    case "default" : $(".posts").css("font-size", "10px"); break;
    case "blue" : $(".posts").css("font-size", "15px"); break;
    case "green" : $(".posts").css("font-size", "30px"); break;
  }

  $(".color_name").on("click", function(){
    var $radio_color = $("input[name='group1']:checked").val()
    $(".color_type").removeAttr("checked")
    $(this).find(".color_type").prop("checked", true);
    $(this).find(".color_type").attr("checked", true);
    switch($radio_color){
        case "default" :
          $(".posts").css("font-size", "10px"); 
          break;
        case "blue" : 
          $(".posts").css("font-size", "15px");
          break;
        case "green" : 
          $(".posts").css("font-size", "30px"); 
          break;
    }
  });

  var $radio_font = $("input[name='group2']:checked").val()
  switch($radio_font){
    case "small" : $(".posts").css("font-size", "10px"); break;
    case "midium" : $(".posts").css("font-size", "15px"); break;
    case "large" : $(".posts").css("font-size", "30px"); break;
  }

  $(".font_size").on("click", function(){
    var $radio_font = $("input[name='group2']:checked").val()
    $(".font_type").removeAttr("checked")
    $(this).find(".font_type").prop("checked", true);
    $(this).find(".font_type").attr("checked", true);
    switch($radio_font){
        case "small" :
          $(".posts").css("font-size", "10px"); 
          break;
        case "midium" : 
          $(".posts").css("font-size", "15px");
          break;
        case "large" : 
          $(".posts").css("font-size", "30px");
          break;
    }
  });

  $(".sort").on("click", function(){
    if( $(this).find("input").attr("checked") ){
      //チェックされていた場合の処理
   }else{
      $(".sort_type").removeAttr("checked")
      $(this).find("input").attr("checked", true)

   }
  });
});