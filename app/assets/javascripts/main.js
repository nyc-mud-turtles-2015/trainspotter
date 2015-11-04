function loadUrl(location)
{
  this.document.location.href = location;
}

function loadDoc(url) {
    $.ajax({
      url: url,
      type: 'delete'
    })
    .done(function(response) {
      $(document).innerHTML = response;
    })
    .fail(function(){
    });
}

$( document ).ready(function() {
  $("#delete_collection").click(function(event) {
    var delete_url = $('#delete_collection a').attr('href');
    var curator_profile = $('#js_owner_of_collection a').attr('href');
    event.preventDefault();
    swal({   title: "Are you sure you want to delete this?",   text: "It will be gone forever!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes!",   cancelButtonText: "Cancel!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){
        if (isConfirm) {
          loadDoc(delete_url);
          swal({   title: "Your collection has been deleted!",   text: "Just a second!",   timer: 2000,   showConfirmButton: false });
          setTimeout(function(){ loadUrl(curator_profile); }, 1000);
        }
        else {
          swal("Cancelled", "Your collection is safe :)", "error");
        }
      });
    return false;
  });
});
