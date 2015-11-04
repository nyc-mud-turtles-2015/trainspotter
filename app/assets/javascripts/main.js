$( document ).ready(function() {
  $("#delete_collection").click(function(event) {
    event.preventDefault();
    var r = confirm("Are you sure you want to delete this collection?");
    if (r === true) {
        alert("Collection has been deleted.");
    } else {
      location.reload();
      alert("Collection has NOT been deleted.");
      return false;
    }
  });
});
