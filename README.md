Mark It
===========

A Personal BookMarker Manager built using Ruby on Rails

### Local Development 

- install [rails](), [postgres]()
- `git clone git@github.com:copasetickid/mark-it.git`
- `bundle install`
- Set up the `database.yml` file by running this command `mv config/database-sample.yml config/database.yml`
- run `rake db:create`
- run `rake db:seed`
- run `rails sever`


### Tests

Make sure to run `rake db:migrate RAILS_ENV=test`

Run the test suite with `rspec` this covers unit & integration tests

### Demo
A live demo of this application can be found [here](https://markit-manager.herokuapp.com)