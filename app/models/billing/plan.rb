module Billing
  class Plan < ActiveRecord::Base
    attr_accessible :name, :description, :price_per_month, :limit_fields_attributes
    has_many :limit_fields, :as => :limitable
    has_many :fields, :through => :limit_fields
    accepts_nested_attributes_for :limit_fields

    def price_per_month=(ppm)
      ppm = ppm.to_i * 100
      write_attribute(:price_per_month, ppm)
    end

    def price_per_month
      ppm = read_attribute(:price_per_month)
      ppm.nil? ? ppm : ppm.to_f / 100.00
    end

    def price_per_month_in_cents=(ppmic)
      write_attribute(:price_per_month, ppmic)
    end

    def price_per_month_in_cents
      read_attribute(:price_per_month)
    end
  end
end
