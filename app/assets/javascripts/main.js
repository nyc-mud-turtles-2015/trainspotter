$( document ).ready(function() {
  $("div[id^='panel2a']").click(function(event) {
    event.preventDefault();
    // debugger;
    var r = confirm("Are you sure you want to delete this collection?");
    if (r === true) {
      console.log("got to if");
      alert("Collection deleted successfully");
    } else {
      // console.log("got to else");
      $.ajax({
        type: "get",
        url: $("form[id^='edit_curator']").attr('action')
      })
      .done(function(data) {
        $('document').replaceWith(data);
        // alert("Collection NOT deleted");
      })
      .fail(function(data) {

        alert("FAIL");
      });
    }
  });
});
