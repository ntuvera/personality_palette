function grabEntries(){
  $.ajax({
    url: "/users/2/entries",
    dataType: "json",
    success: function(data){
      console.log(data)
    }
  })
}


// setTimeout(function(){
//   $('#emotion-wheel').fadeIn('slow')}, 5000);
