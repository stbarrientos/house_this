$(document).ready(function(){
  
  $("#new-roommate").on("submit", function(event){
    event.preventDefault();
    var userEmail = $("#user_email").val();
    var roomId = parseInt($(this).attr("room-id"));
    $.ajax({
      url: "/rooms/" + roomId + "/roommates?user_email=" + userEmail,
      method: "POST",
      dataType: "json",
      data: {roommate: { room_id: roomId } },
      success: function(data){
        if (data.status === 203){
          $("#roommates-notifications").html(data.message);
        } else {
          $("#roommates-notifications").html("");
          var htmlString = "<li>" + data.email + "<span><button class='delete-roommate' roommate-id='" + data.roommate_id + "' room-id='" + data.room_id + "'>X</button></span></li>";
          $("#roommates-list").append(htmlString);
        }
      }
    });
  }); 

  $("#roommates-list").on("click", "button.delete-roommate", function(){
    var target = $(this).parent().parent();
    var roommateId = $(this).attr("roommate-id");
    var roomId = $(this).attr("room-id");
    $.ajax({
      url: "/rooms/" + roomId + "/roommates/" + roommateId,
      method: "DELETE",
      dataType: "json",
      success: function(data){
        target.remove();
      }
    });
  });

  $("div.user-notifications").on("click", "button.accept", function(event){
    event.preventDefault();
    var target = $(this).parent();
    var roommateId = $(this).attr("roommate-id");
    var roomId = $(this).attr("room-id");
    $.ajax({
      url: "/rooms/" + roomId + "/roommates/" + roommateId + "?accepted=1",
      method: "PUT",
      dataType: "json",
      success: function(data){
        target.remove();
      }
    });
  });
});
