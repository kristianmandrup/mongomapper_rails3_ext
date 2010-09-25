begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mongomapper_rails3_ext"
    gem.summary = %Q{Rails 3 extras for Mongo Mapper}
    gem.description = %Q{Includes db rake tasks and more railtie functionality. Based on similar mongoid railtie.}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/mongomapper_rails3_ext"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec", "~> 2.0.0.beta-22"
    gem.add_development_dependency "mocha", "~> 0.9.8"

    gem.add_dependency "mongo_mapper", "~> 0.8.4"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

