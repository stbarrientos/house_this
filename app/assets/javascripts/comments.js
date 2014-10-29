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
        $("ul.comments").append("<li>" + data.body + " (from: " + data.email + ")<a class='delete-comment' comment-id='" + data.id + "'>X</a></li>");
        $("#comment-body").val("");
      }
    });
  });  
  
 $("ul#places-list").on("click", "a.expand", function(){
   event.preventDefault();
   var target = $($(this).attr("target"));
   var placeId = $(this).attr("place-id");
   if ( target.hasClass("hidden")){
     $(this).text("(hide)");
   } else {
     $(this).text("(show)");
   }
   target.toggleClass("hidden");
   $("form[place-id='"+placeId+"']").toggleClass("hidden");
 });

  $("ul.comments").on("click", "a.delete-comment", function(event){
    event.preventDefault();
    self = $(this)
    var commentId = $(this).attr("comment-id");
    $.ajax({
      url: "/comments/" + commentId,
      method: "DELETE",
      dataType: "json",
      success: function(data){
        self.parent().remove();
      } 
    });
  });
});
