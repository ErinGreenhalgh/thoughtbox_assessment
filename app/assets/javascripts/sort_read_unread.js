$(document).ready(function(){
  $(".all-read").on("click", function(){
    $(".false").hide("slide")
    $(".true").show("slide")
  })

  $(".all-unread").on("click", function(){
    $(".true").hide("slide")
    $(".false").show("slide")
  })
})
