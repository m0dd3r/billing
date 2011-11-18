module Billing
  class Plan < ActiveRecord::Base
    attr_accessible :name, :description, :price_per_month, :limit_fields_attributes
    has_many :limit_fields, :as => :limitable, :dependent => :destroy
    has_many :fields, :through => :limit_fields
    accepts_nested_attributes_for :limit_fields, :allow_destroy => true

    def price_per_month=(ppm)
      ppm = ppm.to_i * 100
      write_attribute(:price_per_month, ppm)
    end

    def price_per_month
      ppm = read_attribute(:price_per_month)
      ppm.nil? ? ppm : ppm.to_f / 100.00
    end

    # THIS IS A HACK!!
    # form_helper likes textual representations of things so it tries to grab #{attribute}_before_type_cast
    # instead of the normal getter.  This is normally fine until you override a getter like I did here for 
    # price_per_month.  This respond_to? hack simply tells form_helper that price_per_month_before_type_cast
    # doesn't exist and forces the normal getter to get called.  hooray!
    # def respond_to?(*args)
    #   if args.first.to_s == "price_per_month_before_type_cast"
    #     false
    #   else
    #     super
    #   end
    # end

    def price_per_month_in_cents=(ppmic)
      write_attribute(:price_per_month, ppmic)
    end

    def price_per_month_in_cents
      read_attribute(:price_per_month)
    end
  end
end
