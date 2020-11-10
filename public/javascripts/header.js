/* ajax方式从服务器请求header头部部分 */
/* $(function(){
    $.ajax({
      url:'../../views/header.html',
      //type:"get",
      success:function(result){
        $("#header").html(result);
        $(`<link rel="stylesheet" href="../public/stylesheets/header.css">`).appendTo("head");
      }
    });
}); */
$(function(){
  $("#header").load(
    "http://localhost:5050/header.html",
    function(){
      $(`<link rel="stylesheet" href="../public/stylesheets/header.css"></link>`)
      .appendTo("head");
    }
  );
})