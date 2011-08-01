Feature:Allow users to login and logout
  In order to control access to user specific information
  As a user
  I want to login and logout to access my data
  
  @passing
  Scenario: Logging In
    Given there is a user with email "user@example.com" and password "secret"
    And I am on the home page
    When I fill in "email" with "user@example.com"
    And I fill in "password" with "secret"
    And I press "Log in"
    Then I should be on the task list
    And I should see "You are logged in."
  
  @current
  Scenario: Logging Out
    Given there is a user with email "user@example.com" and password "secret"
    And I am logged in as "user@example.com" and password "secret"
    And I am on the task list
    When I follow "Logout"
    Then I should be on the home page
    And I should see "You are logged out"