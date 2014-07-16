function validateForm() {
  var x = document.forms["new-entry"]["entry[event]"].value;
  if (x == null || x == "") {
    alert("Event name must be filled out");
    return false;
  }
  var y = document.forms["new-entry"]["entry[emotion]"].value;
    if (y == null || y == "") {
      alert("Choose an Emotion from the wheel");
      return false;
    }
  var z = document.forms["new-entry"]["entry[description]"].value;
    if ( z == null ||  z == "") {
      alert("Please add a small description");
      return false;
    }
}

$(function(){
  $('.fadeable').hide().fadeIn('slow');
})
