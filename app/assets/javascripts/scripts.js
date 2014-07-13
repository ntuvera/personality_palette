function grabEntries(){
  $.ajax({
    url: "/users/2/entries",
    dataType: "json",
    success: function(data){
      console.log(data)
    }
  })
}
