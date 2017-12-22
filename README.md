# README
"Home-improvement" is a RESTful content management system (CMS) built from Ruby Rails for use in tracking home improvement projects.  This is extendable to multiple addresses, and each Home (unique address) can contain many projects.  A materials
database exists for tracking materials and quantity on hand. Projects have many items that are unique to a project but
represent materials.  In this way materials can be indirectly added to or removed from a project, whilst retaining
materials database in tact. Additionally, the item quantity is selected for the project and can be matched against
materials on hand to determine if the project has sufficient materials on hand to complete the project.

Users are authenticated through Devise, and can be authenticated using Omniauth through facebook.  Once logged in,
the user can then create home (addresses), projects, materials and add them to projects.  Projects can be deleted
at any time, but materials can only be deleted once all projects are not referencing said material, this way ensuring
that no materials are dropped by accident or carelessness.

The user can see, through the "Insufficient quantity" link, all projects that are currently not realizable due to a
shortage for one or more materials.  These are listed under each project when the link is clicked.

All user input is checked using strong params and novel validations are in place for key aspects for the following:
  House: address present and unique
  Project: name present and unique
  Materials: name present and unique
  User: standard Devise protections

TODO: Make use of material model unit and value_per_unit to add more functionality to site (in the form of project cost)

* Ruby version
  Built from ruby ver '2.3.1'
* System dependencies
  Authentication : Devise gem
                   Omniauth via Facebook, through Devise
                   Dotenv rails for managing facebook env variables

  Bootstrap for CSS styling
                   bootstrap-sass  ver '3.3.7'
* Database creation
  Database creation is driven through intuitive links/views

* Database initialization
  run 'rake db:seed' to obtain a simple data set
* How to run the test suite
  run 'rspec ./spec' to validate novel model architecture

# home-improvement
