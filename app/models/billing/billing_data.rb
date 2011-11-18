module Billing
  class BillingData < ActiveRecord::Base
    attr_accessible :billing_id, :annual_payment, :non_profit, :last_billing_date, :subscription_time
    has_many :limit_fields, :as => :limitable
    has_many :fields, :through => :limit_fields
    accepts_nested_attributes_for :limit_fields

  end
end
