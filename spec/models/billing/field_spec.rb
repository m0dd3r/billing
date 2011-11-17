require 'spec_helper'

module Billing
  describe Field do
    it { should have_attribute :name }
    it { should have_many(:plans).through(:plan_limit_fields) }
  end
end
