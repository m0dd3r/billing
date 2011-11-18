require 'spec_helper'

module Billing
  describe BillingData do
    describe "attributes" do
      %w(account_id plan_id billing_id annual_payment non_profit last_billing_date subscription_time).each do |attribute|
        it { should have_attribute attribute }
      end
    end

    describe "associations" do
      it { should have_many(:limit_fields) }
      it { should have_many(:fields).through(:limit_fields) }
    end
    
    describe "accept nested attributes for plan_limit_fields" do
      subject { BillingData.create(:limit_fields_attributes => {
                              "0" => { 
                                :field_name => field_names[0], 
                                :value => 5 },
                              "1" => {
                                :field_name => field_names[1], 
                                :value => 12 } 
                              }) }
      it_behaves_like "any limitable"
    end
  end
end
