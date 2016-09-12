$(document).ready(function(){
  $(".search").on("keyup", function(){
    var linkTitles = $(".title")
    var searchText = $(this).val().toLowerCase();
    linkTitles.each(function(link){
      var titleText = $(this).text().toLowerCase()
      var link = $(this).parent().parent()
      if (titleText.includes(searchText)){
        link.show("slide");
      } else {
        link.hide("slide");
      }
    })
  })
});
