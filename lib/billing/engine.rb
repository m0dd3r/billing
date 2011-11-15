require 'rails'
require 'billing'

module Billing

  class Engine < Rails::Engine
    # engine_name "billing"

    # initializer "billing.load_app.instance_data" do |app|
    #   Billing.setup do |config|
    #     config.app_root = app_root
    #   end
    # end

    initializer "billing.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end
