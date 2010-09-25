# Mongo Mapper rails 3 extension

Adds support for db rake tasks and configuring the database using a yaml file following Rails conventions

## Install

<code>gem install mongomapper_rails3_ext</code>

or in Rails Gemfile

<pre>
  gem 'mongomapper_rails3_ext'
</pre>

And run <code>bundle install</code> in the terminal in Rails.root

## Database configuration

Define a file 'mongo_mapper.yaml' file in the /config directory of your rails app.

<pre>
defaults: &defaults
  host: localhost

development:
  <<: *defaults
  database: mongo_mapper   
</pre>

## Seed data

Define your seed data in *db/seeds.rb*

Run rake task in terminal:
<code>rake db:seed</code>

Run <code>rake -T</code> to see all available tasks ;)

Enjoy!

## Note

This gem is based on the railtie of mongoid and has not been thorougly tested. Feel free to fix any bugs, come with suggestions etc.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
