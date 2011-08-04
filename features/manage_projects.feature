Feature:Manage projects
  In order to track tasks associated with projects
  As a user
  I want to manage projects
  
  Background:
    Given there is a user with email "user@example.com" and password "secret"
    And I am logged in as "user@example.com" with password "secret"
  
  @passing
  Scenario: Project index shows projects
    Given the following project record
      | project_num | name            |
      | 12341       | The Big Project |
    When I go to the project list
    Then I should see "12341"
    And I should see "The Big Project"
    And I should see "Details"
  
  @passing
  Scenario: Following the details link goes to the details page
    Given the following project record
      | project_num | name                 |
      | 98765       | Just a small project |
    And I am on the project list
    When I follow "Details"
    Then I should see "Details"
    And I should see "98765"
    And I should see "Just a small project"
  
  @current
  Scenario: Creating a new project
    Given I am on the project list
    When I follow "Add a project"
    And I fill in the following:
      |project_num|08642|
      |name|New Project|
      |location|Farfromhome, IA|
    And I press "Add Project"
    Then I should be on the project list
    And I should see "Project Added"
    And I should see "08642"
    And I should see "New Project"
    And I should see "Farfromhome, IA"