# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
-- used Ruby on Rails for entire project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
-- many join tables with has_many, has_many, through: and belongs_to relationships
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
-- see above
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
-- see above
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
-- see above
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
-- user can leave notes on any author, book or genre
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
-- user.name, user.email, user.password, (author|book|genre).name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- /(:author|:book|:genre)/popular
- [x] Include signup (how e.g. Devise)
-- Sign Up link
- [x] Include login (how e.g. Devise)
-- Log In link
- [x] Include logout (how e.g. Devise)
-- Log Out button
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
-- through OmniAuth via GitHub
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
-- /users/:user_id/(authors|books|genres)[/:id]
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
-- Favorite button
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
-- flashed messages; red highlight

Confirm:
- [x] The application is pretty DRY
-- abstracted almost all to application_controller and helper methods
- [x] Limited logic in controllers
-- nearly zero logic in all controllers except application_controller
- [x] Views use helper methods if appropriate
-- extensively
- [x] Views use partials if appropriate
-- extensively; partials shared by multiple views
