$(document).ready(function(){
  $.ajax({
    url: '/api/v1/links',
    method: "GET",
    dataType: "JSON",
    success: function(link){
      $(link).each(function(index, link){
        $(".all-links").append(linkStructure(link))
      })
    },
    error: function(errorResponse){
      console.log(errorResponse)
    }
  })
})
