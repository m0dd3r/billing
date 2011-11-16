require 'rails/generators/active_record'
require 'generators/billing/orm_helpers'

module ActiveRecord
  module Generators
    class BillingGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      include Billing::Generators::OrmHelpers
      source_root File.expand_path("../templates", __FILE__)

      def copy_billing_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "migration_existing.rb", "db/migrate/add_billing_to_#{table_name}"
        else
          migration_template "migration.rb", "db/migrate/billing_create_#{table_name}"
        end
      end

      def generate_model
        invoke "active_record:model", [name], :migration => false unless model_exists?
      end

      def inject_billing_content
        inject_into_class(model_path, class_name, model_contents) if model_exists?
      end
    end
  end
end
