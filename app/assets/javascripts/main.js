$(document).ready(function(){
  
  function deletePlace(){
    var placeId = parseInt($(this).attr("place-id"));
    var roomId = parseInt($(this).attr("room-id"));
    var target = $(this).parent().parent();
    $.ajax({
      url: "/rooms/" + roomId + "/places/" + placeId,
      method: "DELETE",
      dataType: "json",
      success: function(response){
        target.remove();
      }
    });
  };

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
        var htmlString = "<li>" + response.address + "<span><button class='delete' place-id='" + response.id + "' room-id='" + roomId + "'>X</button></span><ul class='hidden'>";

        htmlString += "<li>Price: " + parseFloat(response.price) + "</li>";
        htmlString += "<li>Beds: " + parseFloat(response.beds) + "</li>";
        htmlString += "<li>Baths: " + parseFloat(response.baths) + "</li>";
        htmlString += "<li>Sqft: " + parseFloat(response.sqft) + "</li>";
        htmlString += "<li>Amenities: " + response.amenities + "</li></ul></li>"
        $("#places-list").append(htmlString);
      }
    });
  });

  $("#places-list").on("click","button.delete", deletePlace);

});
