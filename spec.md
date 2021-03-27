# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used the sinatra framework for project
- [x] Use ActiveRecord for storing information in a database - Included ActiveRecord in Gemfile and inherited from ActiveRecord in models and controllers
- [x] Include more than one model class (e.g. User, Post, Category) - Have multiple models (Users, Players, User-Teams ...etc)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Users has many User-Teams
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - User-Teams belong to a User
- [x] Include user accounts with unique login attribute (username or email) - in the Users model using ActiveRecord has a validates username for uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Each user-team you can create, view, edit, and delete
- [x] Ensure that users can't modify content created by other users - Helper methods to check the session user_id and authorize if that user can CRUD those resources
- [x] Include user input validations - Created drop down choices so that users could not put in invalid player names.  Also included a validation that you can only have 5 players per team by only having 5 dropdowns. 
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Flash messages for failures or successes on login/signup as well as team create.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
