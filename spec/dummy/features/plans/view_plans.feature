Feature: View Plans
  As a prospective user
  I want to view the available plans

  Scenario: View all plans
    Given there is a plan named Sky Blue
    And there is a plan named Blue
    And there is a plan named Navy Blue
    And there is a plan named Damn Near Black Blue
    When I visit the billing plans page
    Then I should see "Sky Blue"
    And I should see "Blue"
    And I should see "Navy Blue"
    And I should see "Damn Near Black Blue"

