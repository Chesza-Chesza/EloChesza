# CHESZA

![alt text](https://github.com/Chesza-Chesza/EloChesza/blob/test/app/assets/images/logo_chesza.png "CHESZA LOGO")

CHESZA is an app that helps chess players calculate their Elo in an easier way! 
It even provides the necessary tools to calculate the results of a tournament for all players simultaneously.

# Dependencies

 The app was created with: 
* Ruby 2.7.2
* Rails 6.1.3

# Database

For the database we used PostgreSQL, please remember to change your PostgreSQL credentials on the `.env file` before running the following commands:

  `rails db:create`
 
  `rails db_migrate`
 
  `rails db:seed` 

# Gems
The listed gems where the ones used to develop some useful functions on the app:

  * [gem 'rails-erd'](https://github.com/voormedia/rails-erd "Rails ERD")
  
  * [gem 'bullet'](https://github.com/flyerhzm/bullet "Bullet")
  
  * [gem 'devise'](https://github.com/heartcombo/devise "Devise")
  
  * [gem 'dotenv-rails'](https://github.com/bkeepers/dotenv "dotenv")
  
  * [gem 'chartkick'](https://github.com/ankane/chartkick "Chartkick")
  
  * [gem 'csv'](https://github.com/ruby/csv "CSV")
  
  * [gem 'groupdate'](https://github.com/ankane/groupdate "Groupdate")

After checking if the [Gemfile](https://github.com/Chesza-Chesza/EloChesza/blob/main/Gemfile) is complete, run:

`bundle install`

# Other dependencies
Remember to add the yarn to install all dependencies of the project:

`yarn install`

# Running the app:
The last step to enjoy the app is running the server:

`rails s`
