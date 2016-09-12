$(document).ready(function(){
  $(".all-links").on("click", ".edit", function(){
    $(this).siblings(".url").attr("contenteditable", "true")
  })

  $(".all-links").on("blur", ".url", function(){
    var linkId = $(this).attr("id").split("-")[1];
    var editedUrl = $(this).text();
    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      dataType: "JSON",
      data: { link: { url: editedUrl } },
      success: function(link){
        $("#url-" + link.id).text(
          editedUrl
        )
      },
      error: function(){
        console.log("It did't work")
      }
    });
  })
})
