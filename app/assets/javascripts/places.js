$(document).ready(function(){
  
  function deletePlace(){
    var placeId = parseInt($(this).attr("place-id"));
    var roomId = parseInt($(this).attr("room-id"));
    var target = $(this).parent();
    $.ajax({
      url: "/rooms/" + roomId + "/places/" + placeId,
      method: "DELETE",
      dataType: "json",
      success: function(response){
        target.remove();
      }
    });
  };

  $("#places-list").on("click","a.delete-place", deletePlace);

  $("#import-data").on("click", function(event){
    event.preventDefault();
    var url = $("#place_url").val();
    $.ajax({
      url: "/app/fetch_specs?file=" +  url,
      method: "GET",
      dataType: "json",
      success: function(data){
        $("#place_address").val(data.address);
        $("#place_price").val(data.price);
        $("#place_beds").val(data.beds);
        $("#place_baths").val(data.baths);
        $("#place_sqft").val(data.sqft);
        $("#place_amenities").val(data.amenities);
      }
    });  
  }); 
 
  $("#new-place").on("submit", function(event){
    event.preventDefault();
    var roomId = parseInt($(this).attr("data-id"));
    var url = $("#place_url").val();
    var address = $("#place_address").val();
    var price = $("#place_price").val().match(/\d/g).join("");
    var beds = $("#place_beds").val();
    var baths = $("#place_baths").val();
    var sqft = $("#place_sqft").val().match(/\d/g).join("")
    var amenities = $("#place_amenities").val();
    $.ajax({
      url: "/rooms/" + roomId + "/places",
      method: "POST",
      dataType: "json",
      data: { place: { url: url, address: address, price: price, beds: beds, baths: baths, sqft: sqft, amenities: amenities }},
      success: function(response){
        var htmlString = "<li>" + response.address + "<a class='delete-place' place-id='" + response.id + "' room-id='" + roomId + "'>X</a>";
        htmlString += "<p>Details<a target='ul.details' place-id='" + response.id + "' room-id='" + roomId + "'>(show)</a></p>";
        htmlString += "<p>Comments<a target='ul.comments' class='expand' place-id='" + response.id + "'>(show)</a></p>"
        htmlString += "<ul class='hidden comments'"
        htmlString += "<li>Price: " + parseFloat(response.price) + "</li>";
        htmlString += "<li>Beds: " + parseFloat(response.beds) + "</li>";
        htmlString += "<li>Baths: " + parseFloat(response.baths) + "</li>";
        htmlString += "<li>Sqft: " + parseFloat(response.sqft) + "</li>";
        htmlString += "<li>Amenities: " + response.amenities + "</li></ul>";
        htmlString += "</ul>";
        htmlString += "<form place-id='" + response.id + "' class='new-comment'>";
        htmlString += "<label>New Comment</label>";
        htmlString += "<input type='text' placeholder='comment' id='comment-body'>";
        htmlString += "<input type='submit'></form></li></ul>"; 
        $("#places-list").append(htmlString);
      }
    });
  });

  $("#expand-notifications").on("click", function(event){
    event.preventDefault();
    $(".user-notifications").toggleClass("hidden");  
  });


});
