$('.complete-item').on('click', function(e){
  e.preventDefault();
  var id = $(this).attr('data-id');
  $(this).parent().parent().addClass("success");
  $.ajax({
    url: 'task/'+id, 
    method: 'PUT',
    success: function(response){
    },
    error: function(response){
    }
  })
});
$('.delete-item').on('click', function(e){
  e.preventDefault();
  var that = $(this);
  var id = that.attr('data-id');
  swal({
    title: "Are you sure?",
    text: "You will not be able to recover this imaginary task!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Yes, delete it!",
    cancelButtonText: "No, cancel plx!",
    closeOnConfirm: false,
    closeOnCancel: false
  }, function(isConfirm){
    if (isConfirm) {
      $.ajax({
        url: 'task/'+id, 
        method: 'DELETE',
        success: function(response){
          that.parent().parent().remove();
          swal("Deleted!", "Your imaginary task has been deleted.", "success");
        },
        error: function(response){
          swal("Error", "There seems to be an error, if it persists then something is wrong with the code", "error");
        }
      })
      
    }
    else {
      swal("Cancelled", "Your imaginary task is safe :)", "error");
    }
  });
});