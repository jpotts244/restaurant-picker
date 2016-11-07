$(".restaurant-form").submit(function(event){
  event.preventDefault();
  
  var $location    = $(".location").val();
  var $cuisineType = $(".cuisine-type").val();

  var data = { location: $location, cuisine_type: $cuisineType }
  var posting = $.post("/restaurants", data);

  posting.done(function(data){
    var restaurantResults = JSON.parse(data);
  
    $("#header").empty().append("<h1>YOU SHOULD EAT HERE SON</h1>");
    $("#result").empty().append("<p>" + restaurantResults[0] + "</p><p>" + "rating: " + restaurantResults[1] + "</p><p>" + restaurantResults[3] + "</p>");
    $("#restaurantUrl").empty().append('<a href="'+ restaurantResults[2] + '">' + "check it" + '</a>');
  });
});
