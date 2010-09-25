# encoding: utf-8
require "singleton"
require "mongo_mapper"
require "rails"

module Rails #:nodoc:
  module MongoMapper #:nodoc:
    class Railtie < Rails::Railtie #:nodoc:

      config.generators.orm :mongo_mapper, :migration => false

      rake_tasks do
        load "mongomapper_rails3_ext/tasks/database.rake"
      end

      # Exposes MongoMapper's configuration to the Rails application configuration.
      #
      # Example:
      #
      #   module MyApplication
      #     class Application < Rails::Application
      #       config.mongo_mapper.logger = Logger.new($stdout, :warn)
      #       config.mongo_mapper.reconnect_time = 10
      #     end
      #   end

      config.mongo_mapper = ::MongoMapper.config

      # Initialize MongoMapper. This will look for a mongo_mapper.yml in the config
      # directory and configure mongo_mapper appropriately.
      #
      # Example mongo_mapper.yml:
      #
      #   defaults: &defaults
      #     host: localhost
      #
      #   development:
      #     <<: *defaults
      #     database: mongo_mapper 
      
      initializer "setup database" do
        begin
          config_file = Rails.root.join("config", "mongo_mapper.yml")                      
          settings = YAML.load(ERB.new(config_file.read).result)[Rails.env] if config_file.file?
        rescue
          puts "\nMongoMapper config not found. Create a config file at: config/mongo_mapper.yml"
          puts "to generate one run: rails generate mongo_mapper:config\n\n"
        end

        begin
          if settings.present? 
            if settings['adapter'] == 'mongodb'                      
              MongoMapper.connection = Mongo::Connection.new(settings['hostname'] || 'locahost')
              MongoMapper.database = settings['database']
            end
          else
            puts "\nThe adapter: entry should be set to 'mongodb'"            
          end
        rescue
          puts "\nError in MongoMapper config settings."
          puts "You should have a database: entry with the name of the database and optionally a hostname: entry"
          puts "By default hostname is set to localhost if not present"
        end
      end
    end
  end
end
