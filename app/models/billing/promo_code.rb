module Billing
  class PromoCode < ActiveRecord::Base
    attr_accessible :name, :description, :code, :valid_through
  end
end
