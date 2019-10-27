$(function(){
  $("#search_btn").on("keyup", function(){
    var input = $("#search_btn").val();
    $.ajax({
      type: "GET",
      url:" /genres/:genre_id/programs/:program_id/programs",
      data: {keyword: input},
      dataType: "json"
    })
    .done(function(programs) {
      $(".listview.js-lazy-load-images").empty();
      if (programs.length !== 0) {
        programts.forEach(function(program){
          appendProgram(program);
        });
      }
      else {
        appendErrMsgToHTML("一致する映画はありません");
      }
    }) 
  })
});

  // function appendProgram(program){
  // //   var html = `${program.title}`
  // // }