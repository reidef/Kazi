Feature:Manage tasks for a specific project
  In order to see the full scope of work on a project
  As a user
  I want to track tasks specifically for a project
  
  Background:
    Given there is a user with email "user@example.com" and password "secret"
    And I am logged in as "user@example.com" with password "secret"
    And the following project record
      | project_num | name            |
      | 12341       | The Big Project |
  
  @passing
  Scenario: Add a task to a project
    Given I go to the details page for project number "12341"
    When I add a task titled "Submit RFI"
    Then I should be on the details page for project number "12341"
    And I should see "Submit RFI"
    And I go to the task list
    And I should not see "Submit RFI"
  
  @passing
  Scenario: Add an existing project task to user's task list
    Given project number "12341" has tasks Set up calculations, Lay out wall
    And I go to the details page for project number "12341"
    When I follow "Add to my list" within "div#task_1"
    Then I should be on the details page for project number "12341"
    And I go to the task list
    And I should see "Set up calculations"