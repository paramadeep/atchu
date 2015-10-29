ATCHU
=====

Make Active Records form DB with composite keys

Let us say we create a database called 'books'. And 'books' would contain 1 table - 'details'.

CREATE DATABASE books;
CREATE TABLE book_details(id NUMERIC PRIMARY KEY, title VARCHAR,
                     name VARCHAR);

How to set up Atchu with the above schema:
------------------------------------------
1.CREATE A .yml file to specify the configuration for the db(the db for which active records must be created - in this case 'books')

:db:
  :username: booklover
  :password: ilovebooks
  :port:
  :timeout: 5000
  :adapter: postgresql
  :database: books
:out_path: "./models/"

2. In the rake task file(say the file is called test.rake), link the above db config file for Atchu

namespace :bookDb do
  desc "create active records for Books db"
  task :model do
    require 'atchu'
    Atchu.for_db("features/data/db.yml").generate_models_at "features/data/db_models"
  end
end

3. Include 'atchu' in your Gemfile.

  gem 'atchu'

Set up is done!

Now run the rake task 'rake bookDB:model'
(It is derived from the 'namespace' and the 'task' name in test.rake file).

After this,inside the relative out_path "features/data/db_models" of the current project(as specified in the test.rake),
we can find 1 file called detail.rb

class DetailDb < ActiveRecord::Base
  self.table_name = 'details'
  self.primary_key = :id
end

And you can use the generated Active records as any normal active record

DetailDb.new({'id' => 1, 'title' => 'Test Driven Development', 'author' => 'Kent Beck'}).save

##Credits:
Inspired by [RMRE](https://github.com/bosko/rmre)
