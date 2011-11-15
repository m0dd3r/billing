# Requires
require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'
module Billing
  module Generators

    class BillingGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      # def self.next_migration_number(dirname)
      #   if ActiveRecord::Base.timestamped_migrations
      #     Time.new.utc.strftime("%Y%m%d%H%M%S")
      #   else
      #     "%.3d" % (current_migration_number(dirname) + 1)
      #   end
      # end

      def copy_migrations
        # !!!!!IMPORTANT NOTE!!!!!!
        # When adding new migration templates to be copied into an app that's already had the
        # billing generator run, make sure they get added at the beginning of this list, pushing
        # the existing templates down.  Once the generator gets an error that a migration
        # already exists, it stops.
        %w(create_promo_codes create_plans).each do |migration|
          migration_template "#{migration}_table.rb", "db/migrate/#{migration}_table.rb"
          sleep(1)
        end
      end
    end
  end
end

