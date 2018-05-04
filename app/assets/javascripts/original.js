$(document).ready( function() {// When the Dom is ready
    $(".alert").fadeOut(2000); //Add a fade out effect that will last for 2000 millisecond
    $('form').preventDoubleSubmission();





$.fn.preventDoubleSubmission = function() {
  $(this).on('submit',function(e){
    console.log("here I am ");
    var $form = $(this);

    if ($form.data('submitted') === true) {
      // Previously submitted - don't submit again
      e.preventDefault();
    } else {
      // Mark it so that the next submit can be ignored
      $form.data('submitted', true);
    }
  });

  // Keep chainability
  return this;
};



});







// jQuery plugin to prevent double submission of forms