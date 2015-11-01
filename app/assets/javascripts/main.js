$( document ).ready(function() {
  $('#curators_search').submit(function(event) {
   event.preventDefault();
    $.ajax({
      type: "GET",
      url:  "/curators/search",
      data: $('#curators_search').serialize(),
      success: function(data) {
        console.log("success");
        $('#append_curator_search_results').append(data);
      },
      error: function() {
         console.log("didnt work");
      }
    });
  });
});



