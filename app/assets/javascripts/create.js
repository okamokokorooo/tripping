$(function(){
  $("select").hover(function(){
    $("#title").fadeIn();
  })
  $("#title").keydown(function(){
    $("#text").fadeIn();
  })
  $("#text").keydown(function(){
    $("#file").fadeIn();
  })
  $("#file").hover(function(){
    $(".action_btn").fadeIn();
  })
  $(".action_btn").submit(function(){
    console.log("ありがとう");
  })
  $("#name").keydown(function(){
    $("#e_mail").fadeIn();
  })
  $("#e_mail").keydown(function(){
    $("#pass").fadeIn();
  })
  $("#pass").keydown(function(){
    $("#pass_conf").fadeIn();
  })
  $("#pass_conf").keydown(function(){
    $(".login_btn").fadeIn();
  })
})

