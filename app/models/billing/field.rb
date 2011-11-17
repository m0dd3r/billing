module Billing
  class Field < ActiveRecord::Base
    attr_accessible :name
    has_many :plan_limit_fields
    has_many :plans, :through => :plan_limit_fields
  end
end
