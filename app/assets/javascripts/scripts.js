function grabEntries(){
  $.ajax({
    url: "/users",
    dataType: "json",
    success: function(data){
      console.log(data)
    }
  })
}
