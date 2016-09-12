# ThoughtBox
This app serves as the Mod 4 Assessment for the Turing School. The goal is to demonstrate proficiency with Rails and asynchronous client-side Javascript.

### [Production App](http://thoughtboxing.herokuapp.com/)

* See full project spec [here](https://gist.github.com/stevekinney/82831c5b25029415ce8b#file-simulated-assessment-md)

###Notes on Completion
* **Iteration 1:** A new user can create an account and can log out. User email must be unique. As it is not mentioned in the spec, login for registered users is not implemented.

* **Iteration Two:** A logged in user can see a form to create a new link. Via ajax, the user can submit the title and url for a new link and see it show up in the links index without reloading the page. Validations for URL have not been implemented.

* **Iteration Three:** A logged in user can change the status of their links by clicking "mark as read/unread". Links that are marked as read turn grey. Marking them as unread changes them back to white. Updating links is done through ajax.

* **Iteration Four:** In order to edit the an existing link url, a logged in user can click the "edit" button. The link field then becomes a contenteditable field. The user can type the new url, and when they click away, an ajax call fires to update the url in the database. The updated url persists upon reload. Again, no validations have been implemented to ensure that the updated url is valid.

* **Iteration Five:** Some of the filtering requirements have been implemented. Marking a link as read or unread was already implemented through jQuery in iteration 3. The user can type into the search field and see links filtered by matching search terms. The user can click "see all read/unread" to filter by read and unread links. This sort of works, but it is buggy. There is a button to sort alphabetically, but this feature has not yet been implemented. 
