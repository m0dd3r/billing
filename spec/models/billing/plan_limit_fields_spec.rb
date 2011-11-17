require 'spec_helper'

module Billing
  describe PlanLimitField do
    describe "attributes" do
      it { should have_attribute :value }
    end
    describe "associations" do
      it { should belong_to :plan }
      it { should belong_to :field }
    end

    describe "methods" do
      subject { PlanLimitField.new(:field => Field.new(:name => "asdf")) }
        its(:field_name) { should == "asdf" }
        describe "should set field_name with field_name=" do
          before do
            subject.field_name = "qwer"
          end
          its(:field_name) { should == "qwer" }
        end
    end
  end
end
