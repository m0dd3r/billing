Feature: Manage plans available to BB2 users
  As an admin
  I want to create, update, and delelete plans
  so that we can provide different types accounts to customers

  Scenario: View all plans with controls
    Given there is a plan with the following attributes:
      | Name | Description | Price | PlanLimitFieldNames | PlanLimitFieldValues |
      | blue | a blue plan | 25.00 | users             | 10                      |
    When I visit the billing plans page
    Then I should see "blue"
    And I should see "a blue plan"
    And I should see "$25.00"
    And I should see "users"
    And I should see "10"
    And I should see a link to "edit"
    And I should see a link to "delete"
    And I should see a link to "Create a new plan"

  Scenario: Create a new Plan
    Given there are no plans
    And there are fields with the following attributes:
      | name    |
      | Users   |
      | Storage |
    And I am on the billing plans page
    When I follow "Create a new plan"
    Then I should be sent to the new billing plan page
    When I fill out "Name" with "Super Effing Blue"
    And I fill out "Description" with "A super effing blue plan for people who are super effing blue about their old CRM"
    And I fill out "Price per month" with "25.00"
    And I select "Users" from the list of plan limit fields
    And I fill out "Limit" with "10"
    And I press Save
    Then I should be sent to the billing plan page for "Super Effing Blue"
    And I should see "New plan created!"
    And I should see "Super Effing Blue"
    And I should see "A super effing blue plan for people who are super effing blue about their old CRM"
    And I should see "$25.00"
    And I should see "Users"
    And I should see "10"
    And there should be 1 plan

  Scenario: Modify a plan's details
    Given there is a plan with the following attributes:
      | Name        | Description | Price | PlanLimitFieldNames | PlanLimitFieldValues |
      | Wicked Blue | a blue plan | 25.00 | users,storage       | 10,5                 |
    And I am on the billing plans page
    When I follow "edit" 
    Then I should be sent to the edit billing plan page for "Wicked Blue"
    And I should see "Name" with "Wicked Blue" in it
    When I fill out "Name" with "Super Wicked Blue"
    And I fill out "Description" with "AWWWWW YEAH!!!"
    And I fill out "Price per month" with "500.00"
    And I press Save
    Then I should be sent to the billing plan page for "Super Wicked Blue"
    And I should see "Super Wicked Blue"
    And I should see "AWWWWW YEAH!!!"
    And I should see "500.00"
    
