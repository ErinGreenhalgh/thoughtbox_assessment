function linkStructure(link){
  return "<div class='link-full' id='full-" + link.id
            + "'><div class='link-url'>"
              + "<div class='title' id='title-" + link.id
              + "' contenteditable='true'>" + link.title + "</div>"
              + "<div class='url' id='url-" + link.id
              + "' contenteditable='true'>" + link.url + "</div></div>"
            + "<div class='link-features' data-id=" + link.id + ">"
              + "<div class='status' id='status-" + link.id + "'> Status:"
              + link.status + "</div>"
              + "<button class='read   btn btn-default' id='read-" + link.id + "'>Mark as Read</button>"
              + "<button class='unread btn btn-default' id='unread-" + link.id + "'>Mark as Unread</button>"
              + "<button data-id=" + link.id
              + " class='btn btn-warning delete-link' type='button'>Delete</button>"
            + "</div>"
          + "</div>"
}
