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
    var button = this
    var newStatus = updateStatus(currentStatus);
    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      dataType: "JSON",
      data: { link: { status: newStatus}},
      success: function(idea){
        $("#" + linkId).addClass("true")
        $("#" + linkId).removeClass("false")
        toggleButtons(button)
      },
      error: function(errorResponse){
        console.log("Update status did not work")
      }
    })
  })

  $(".all-links").on("click", ".mark-unread", function(){
    var currentStatus = $(this).parent().data("status");
    var linkId = $(this).data("id");
    var button = this
    var newStatus = updateStatus(currentStatus);
    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      dataType: "JSON",
      data: { link: { status: newStatus}},
      success: function(idea){
        $("#" + linkId).removeClass("true")
        $("#" + linkId).addClass("false")
        toggleButtons(button)
      },
      error: function(){
        console.log("Update status did not work")
      }
    })
  })
})

function toggleButtons(button){
  var $button =  $(button)
  var neighbor = $button.siblings()[0]
  var $neighbor = $(neighbor)
  $button.hide()
  $neighbor.show()
}
