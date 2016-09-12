$(document).ready(function(){
  function updateStatus(currentStatus){
    if (currentStatus === false) {
      return "true"
    } else {
      return "false"
    }
  }

  $(".all-links").on("click", ".mark-read", function(){
    var currentStatus = $(this).parent().data("status");
    var linkId = $(this).data("id");
    var newStatus = updateStatus(currentStatus);
    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      dataType: "JSON",
      data: { link: { status: newStatus}},
      success: function(idea){
        $("#" + linkId).addClass("true")
      },
      error: function(){
        console.log("Update status did not work")
      }
    })
  })

  $(".all-links").on("click", ".mark-unread", function(){
    var currentStatus = $(this).parent().data("status");
    var linkId = $(this).data("id");
    var newStatus = updateStatus(currentStatus);
    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      dataType: "JSON",
      data: { link: { status: newStatus}},
      success: function(idea){
        $("#" + linkId).removeClass("true")
      },
      error: function(){
        console.log("Update status did not work")
      }
    })
  })
})
