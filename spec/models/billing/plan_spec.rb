require 'spec_helper'

module Billing
  describe Plan do
    %w(name description payments_per_year price).each do |column|
      it { should have_attribute column.intern }
    end
  end
end
