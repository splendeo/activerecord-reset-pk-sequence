# active-reset-pk-sequence

This gem allows resetting the id of an AR table to 0. It is useful after a delete_all command. It works in Postgres, Sqlite and MySQL up to now.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-reset-pk-sequence'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-reset-pk-sequence

## Usage

This gem adds a method to the class ActiveRecord::Base. Now it is shown an example of how it works.

The first thing is to install the gem as it is explained before.

After that you need a model. If you don't have one you can create it directly with rails as shown.

    rails g model Person name:string
    
Then you do a database migration with:

    rake db:migrate

To test the gem you have to start a rails console:

    rails c

And then write the following commands:

    p = Person.create(:name => 'David')
    p = Person.create(:name => 'James')

You will see that the have the id's 1 and 2, then delete all elements in the table

    Person.delete_all

If you create a new person now you will notice that the id is going to be 3

    p = Person.create(:name => 'Peter')
    id = p.id
    => 3 


And this is what this gem is for, to reset the id's after deleting the elements in a table, to check if it works delete all elements and then run reset_pk_sequence method, after that create a new "Person" and check if its id is 1.

    Person.delete_all
    Person.reset_pk_sequence
    p = Person.create(:name => 'Jhon')

So to sum up to use this gem you only have to add the call to the new method after deleting all the elements in a table.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
