require 'billing/limitable'

module Billing
  class BillingData < ActiveRecord::Base
    attr_accessible :billing_id, :annual_payment, :non_profit, :last_billing_date, :subscription_time
    acts_as_limitable :field
  end
end
