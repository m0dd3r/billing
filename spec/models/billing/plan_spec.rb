require 'spec_helper'

module Billing
  describe Plan do
    describe "attributes" do
      %w(name description price_per_month).each do |column|
        it { should have_attribute column.intern }
      end
    end

    describe "associations" do
      it { should have_many(:fields).through(:plan_limit_fields) }
      pending "should accept nested attributes for plan_limit_field" do
        # plan = Plan.new(:name => "name", :plan_limit_field
      end
    end

    describe "Methods" do
      {price_per_month: 25.0, price_per_month_in_cents: 2500}.each do |method, value|
        context "when #{method} is set to #{value}" do
          subject { Plan.new }
          before do
            subject.send("#{method}=", value)
          end
          its(:price_per_month) { should == 25.00 }
          its(:price_per_month_in_cents) { should == 2500 }
        end
      end
    end
  end
end
