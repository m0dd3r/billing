require 'spec_helper'

module Billing
  describe Plan do
    describe "attributes" do
      %w(name description price_per_month).each do |column|
        it { should have_attribute column.intern }
      end
    end

    describe "associations" do
      it { should have_many(:fields).through(:limit_fields) }
    end
    
    describe "accept nested attributes for plan_limit_fields" do
      subject { Plan.create(:name => "name", 
                            :limit_fields_attributes => {
                              "0" => { 
                                :field_name => field_names[0], 
                                :value => 5 },
                              "1" => {
                                :field_name => field_names[1], 
                                :value => 12 } 
                              }) }
      it_behaves_like "any limitable"
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
