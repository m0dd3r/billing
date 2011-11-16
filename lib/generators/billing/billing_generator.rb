# Requires
require 'rails/generators'
# require 'rails/generators/migration'
# require 'rails/generators/active_record'
module Billing
  module Generators
    class BillingGenerator < Rails::Generators::NamedBase
      namespace "billing"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one doesn't already exist) with billling" <<
      "configuration plus a migration file and billing routes."

      hook_for :orm

      class_option :routes, :desc => "Generate routes", :type => :boolean, :default => true

      def add_billing_routes
        # TODO add routes!
        puts "No routes to add yet!!!"
      end
    end
  end
end

