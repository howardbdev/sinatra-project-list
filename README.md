Welcome to Project List

Sinatra Project List is a very simple project organizer that implements Sinatra and ActiveRecord.  It's designed with an outdoor facility - such as a ski area - in mind.  That's why they must have a name, location, and description to be valid.  Projects have several other optional fields as well.

To use, copy repo and run `bundle`.
Run `shotgun` and copy address listed.

Users can sign up, log in or out, and create projects.  Users consists of a username and password using bcrypt.  Users must be signed in to create, view, edit, or delete projects.  Users may edit or delete only projects they created.
