require 'billing/billable'

class DummyAccountWithBillable
  include Billing::Billable
end

module Billing
  describe Billable do
    describe "method_missing for xyz_limit" do
      it "returns the value the xyz field is limited to for the associated billing_data" do
        account = DummyAccountWithBillable.new
        billing_data = Billing::BillingData.new(:limit_fields_attributes => {
          "0" => { 
          :field_name => "users", 
          :value => 5 },
          "1" => {
          :field_name => "Storage", 
          :value => 12 }})

        account.stub(:billing_data) { billing_data }
        account.users_limit.should == 5
        account.storage_limit.should == 12


      end
    end

  end
end
