$(document).ready(function(){
  $(".alphabet").on("click", function(){
    $.ajax({
      url: '/api/v1/alphabetical',
      method: "GET",
      dataType: "JSON",
      success: function(link){
        $(".all-links").children().hide()
        $(link).each(function(index, link){
          $(".all-links").append(linkStructure(link))
        })
      },
      error: function(errorResponse){
        console.log(errorResponse)
      }
    })
  })
})
