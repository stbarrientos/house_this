$(document).ready(function(){
  
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
 
  $("form").on("submit", function(event){
    event.preventDefault();
    var url = $("#place_url").val();
    var address = $("#place_address").val();
    var price = $("#place_price").val();
    var beds = $("#place_beds").val();
    var baths = $("#place_baths").val();
    var sqft = $("#place_baths").val();
    var amenities = $("#place_amenities").val();
    $.ajax({
      url: "/rooms",
      method: "POST",
      dataType: "json",
      data: { place: { url: url, address: address, price: price, beds: beds, baths: baths, sqft: sqft, amenities: amenities }},
      success: function(response){
        console.log(response);  
      }
    });
  });
});
