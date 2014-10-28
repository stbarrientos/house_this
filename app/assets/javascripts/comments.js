$(document).ready(function(){
  
  $("form.new-comment").on("submit", function(event){
    event.preventDefault();
    var placeId = $(this).attr("place-id");
    var body = $("#comment-body").val();
    $.ajax({
      url: "/comments?place_id=" + placeId,
      method: "POST",
      dataType: "json",
      data: {comment: {body: body}},
      success: function(data){
        $("ul.comments").append("<li>" + data.body + " (from: " + data.email + ")<span><button class='delete-comment' comment-id='" + data.id + "'>X</button></span></li>");
        $("#comment-body").val("");
      }
    });
  });  
  
});
