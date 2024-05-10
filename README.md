# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
This project uses Ruby version 2.7.3. You can install it using [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/).
* System dependencies
This project depends on the following system packages:

- PostgreSQL
- Rails 6.0.6.1
- Postman

Please ensure these are installed on your system.

* Configuration

Copy the sample configuration file and edit it to match your configuration:


cp config/database.yml.sample config/database.yml

* **Database creation**


To create the database, run:


rails db:create


* **Database initialization**


To initialize the database (create tables, etc.), run:


rails db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Run instructions

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Set up the database with `rails db:create db:migrate`.
4. Precompile assets with `rails assets:precompile`.
5. Start the server with `rails server`.

* ...
