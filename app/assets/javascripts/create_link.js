$(document).ready(function(){
  $(".new-link-submit").on('click', function(event){
      event.preventDefault();
      var linkTitle = $(".new-link-title").val();
      var linkUrl   = $(".new-link-url").val();
      var userId    = $(".user-link-container").data("userid")
      var linkData  = {link: {title: linkTitle, url: linkUrl, user_id: userId}};
      $.ajax({
        url: "/api/v1/links",
        method: "POST",
        dataType: "JSON",
        data: linkData,
        success: function(link){
          console.log("I made a link successfully!")
          $(".all-links").prepend(linkStructure(link))
          $(".new-link-title").val("")
          $(".new-link-url").val("")
        },
        error: function(errorResponse){
          alert(errorMessage(errorResponse))
        }
      })
    })
})

function errorMessage(errorResponse){
  var error = JSON.parse(errorResponse.responseText)
  var message = error.message
  return message
}
