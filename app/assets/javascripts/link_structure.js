function linkStructure(link){
  return "<div class='link-full " + link.status +"' id=" + link.id
            + "><div class='link-info'>"
              + "<div class='title' id='title-" + link.id
              + "' contenteditable='true'>" + link.title + "</div>"
              + "<div class='url' id='url-" + link.id
              + "' contenteditable='true'>" + link.url + "</div></div>"
            + "<div class='link-status' data-status=" +link.status+ " data-id=" + link.id + ">"
              + "<button class='mark-read   btn btn-default' data-id=" + link.id + ">Mark as Read</button>"
              + "<button class='mark-unread btn btn-default' data-id=" + link.id + ">Mark as Unread</button>"
              // + "<button class='edit btn btn-default' data-id=" + link.id + ">Edit</button>"
            + "</div>"
          + "</div>" + "<br>"
}
