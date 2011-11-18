module Billing
  class Field < ActiveRecord::Base
    attr_accessible :name
    has_many :limit_fields
    has_many :limitables, :through => :limit_fields
  end
end
