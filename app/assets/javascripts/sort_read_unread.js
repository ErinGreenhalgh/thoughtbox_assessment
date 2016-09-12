$(document).ready(function(){
  $(".all-read").on("click", function(){
    $(".false").hide()
    $(".true").show()
  })

  $(".all-unread").on("click", function(){
    $(".true").hide()
    $(".false").show()
  })
})
