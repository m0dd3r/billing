require 'spec_helper'

module Billing
  describe PromoCode do
    %w(name description code valid_through).each do |attr|
      it { should have_attribute attr.intern }
    end
  end
end
