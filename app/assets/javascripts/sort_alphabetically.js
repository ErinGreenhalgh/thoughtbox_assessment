$(document).ready(function(){
  $(".alphabet").on("click", function(){
    $.ajax({
      url: '/api/v1/alphabetical_links',
      method: "GET",
      dataType: "JSON",
      success: function(link){
        $(link).each(function(index, link){
          $(".all-links").hide
          $(".all-links").append(linkStructure(link))
        })
      },
      error: function(errorResponse){
        console.log(errorResponse)
      }
    })
  })
})
