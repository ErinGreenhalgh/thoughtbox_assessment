function linkStructure(link){
  return "<div class='link-full " + link.status +"' id=" + link.id
            + "><div class='link-info'>"
              + "<div class='title' id='title-" + link.id
              + "'>" + link.title + "</div>"
              + "<div class='url' id='url-" + link.id
              + "'>" + link.url + "</div>"
              + "<button class='edit' data-id=" + link.id + ">Edit</button>"
              + "</div>"
            + "<div class='link-status' data-status=" +link.status+ " data-id=" + link.id + ">"
              + "<button class='mark-read   btn btn-default' data-id=" + link.id + ">Mark as Read</button>"
              + "<button class='mark-unread btn btn-default' data-id=" + link.id + ">Mark as Unread</button>"
            + "</div>"
          + "</div>" + "<br>"
}
