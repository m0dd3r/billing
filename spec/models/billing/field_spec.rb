require 'spec_helper'

module Billing
  describe Field do
    it { should have_attribute :name }
    it { should have_many(:limitables).through(:limit_fields) }
  end
end
