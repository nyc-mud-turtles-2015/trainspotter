function loadUrl(location)
{
  this.document.location.href = location;
}

function deleteHttpRequest(url) {
    $.ajax({
      url: url,
      type: 'delete'
    })
    .done(function(response) {
    })
    .fail(function(response){
    });

}

$( document ).ready(function() {
// delete observations
  $("#delete_observation").click(function(event) {
    var delete_obs_url = $('#delete_observation a').attr('href');
    var collection_id = $('#delete_observation').data('collection');
    event.preventDefault();
    swal({   title: "Are you sure you want to delete this?",   text: "It will be gone forever!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes!",   cancelButtonText: "Cancel!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){
        if (isConfirm) {
          deleteHttpRequest(delete_obs_url);
          swal({   title: "Your sighting has been deleted!",   text: "Just a second!",   timer: 2000,   showConfirmButton: false });
          setTimeout(function(){ loadUrl('/collections/' + collection_id); }, 1000);
        }
        else {
          swal("Cancelled", "Your sighting is safe :)", "error");
        }
      });
    return false;
  });

//delete collection
  $("#delete_collection").click(function(event) {
    var delete_coll_url = $('#delete_collection a').attr('href');
    var curator_profile = $('#js_owner_of_collection a').attr('href');
    event.preventDefault();
    swal({   title: "Are you sure you want to delete this?",   text: "It will be gone forever!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes!",   cancelButtonText: "Cancel!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){
        if (isConfirm) {
          deleteHttpRequest(delete_coll_url);
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
