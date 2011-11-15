module Billing
  class Plan < ActiveRecord::Base
    attr_accessible :name, :description, :payments_per_year, :price
  end
end
