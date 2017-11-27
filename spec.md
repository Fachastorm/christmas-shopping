# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

- [x] Use ActiveRecord for storing information in a database
Created tables for giftees and users.

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
Have models for users as well as giftees.

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
Users have many giftees.

- [x] Include user accounts
Users must log in to use the app.

- [x] Ensure that users can't modify content created by other users
logged_in? helper prevents from editing without logging in and checks to see if content is made by user before letting them edit.

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
CRUD app has ability to create, read, update and destroy content.

- [x] Include user input validations
App checks for validation of name and password.

- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)

- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
