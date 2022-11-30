# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  `ruby 2.7.3`

* System dependencies

* Configuration

* Database creation
  `rails db:create`

* Database initialization
  `rails db:seed`

* How to run the test suite
  `rails test`

  I used minitest to write unit testcases of the application

* Steps to run project

  1. Go to project directory
  2. Enter `bundle install` to install all gems
  3. Enter `rails db:create` to create database
  4. Enter `rails db:migrate` to migrate all tables
  5. Enter `rails db:seed` to create dummy data for 10 minutes that can be test via postman
  6. Open postman and import the shared collection
  7. Send request to `Variance of temperate` to see the variance of data created through seed file

* Deployment
  I was trying to deploy to Heroku but I was unable to do so because Heroku remove support of free database tier 2 days ago.

* Reason of selection
  ```
  This is something related to that I have already worked on before, and I thought it's soemething I can complete efficiently.
  ```
* Future Updates
  1. Currently I created dataset using seed and created dummy data, but in the future we should attach it to a streaming service which will automatically insert data in our dataset

  2. Due to above mentioned first step I created variance#index with a paramter using which we can select which data we need to process, after it's connected to a streaming service we can skip that parameter and do it on the basis of DateTime.now

