#Table Transforms
Transform /^table:Name,Description,Price,PlanLimitFieldNames,PlanLimitFieldValues$/ do |table|
  table.hashes.map do |hash|
    plan = Billing::Plan.create!({:name => hash["Name"],
                                 :description => hash["Description"],
                                 :price_per_month => hash["Price"]})
    fields = Array.new
    hash["PlanLimitFieldNames"].split(',').each do |field|
      fields << Billing::Field.create!(:name => field)
    end
    limits = Array.new
    hash["PlanLimitFieldValues"].split(',').each_with_index do |limit, i|
      limits << plan.limit_fields.build(:field => fields[i], :value => limit)
    end

    { :plan => plan, :limits => limits }
  end
end

# Givens
Given /^there is a plan named (.+)$/ do |name|
  Billing::Plan.create!(:name => name)
end

Given /^there are fields with the following attributes:$/ do |table|
  table.hashes.each do |attributes|
    field = Billing::Field.create!(attributes)
  end
end

Given /^there is a plan with the following attributes:$/ do |table|
  table.each do |group|
    plan = group[:plan]
    associations = { :limit_fields => group[:limits] }
    plan.update_attributes(associations)
  end
end

Given /^there are no plans$/ do
  Billing::Plan.delete_all
end

#Whens
When /^I visit the (.+) page$/ do |page_name|
  visit(send spaced_page_to_path(page_name))
end

When /^I am on the (.+) page$/ do |page_name|
  visit(send spaced_page_to_path(page_name))
end

When /^I follow "([^"]*)" for the plan named "([^"]*)"$/ do |link_name|
  click_link "#{link_name}"
end

When /^I follow "([^"]*)"$/ do |link_name|
  click_link "#{link_name}"
end

When /^I select "([^"]*)" from the list of (.+)$/ do |option, list|
  page.select(option, :from => list.singularize)
end

When /^I fill out "([^"]*)" with "([^"]*)"$/ do |form_field, data|
  page.fill_in(form_field, :with => "#{data}")
end

When /^I press (.+)$/ do |button_name|
  page.click_button(button_name)
end

#Thens
Then /^I should see "([^"]*)"$/ do |arg|
  page.should have_content("#{arg}")
end

Then /^I should see "([^"]*)" with "([^"]*)" in it$/ do |field_name, value|
  page.find_field(field_name).value.should == value
end

Then /^I should see a (.+) to "([^"]*)"$/ do |thing, action|
  case thing
  when "link"
    page.should have_link("#{action}")
  when "button"
    page.should have_button("#{action}")
  end
end

Then /^I should be sent to the (.+) page$/ do |page_name|
  page.current_path.should == send(spaced_page_to_path(page_name))
end

Then /^I should be sent to the (.+) page for "([^"]*)"$/ do |page_name, plan_name|
  page.current_path.should == send(spaced_page_to_path(page_name), Billing::Plan.find_by_name(plan_name))
end

Then /^there should be (\d+) (.+)$/ do |num, obj|
  Billing.const_get(obj.singularize.capitalize).count.should == num.to_i
end

#Helper functions
def spaced_page_to_path(page_name)
  page_name.gsub(/\s/, '_') + "_path"
end

