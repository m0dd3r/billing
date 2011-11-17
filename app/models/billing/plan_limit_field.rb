module Billing
  class PlanLimitField < ActiveRecord::Base
    attr_accessible :value, :field, :field_name
    belongs_to :plan
    belongs_to :field

    def field_name=(name)
      self.field = Field.find_or_create_by_name(name)
    end

    def field_name
      self.field.name unless self.field.nil?
    end
  end
end
