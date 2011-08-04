Feature:Manage user tasks
  In order track my tasks
  As a user
  I want to view and edit my task list
  
  Background:
    Given there is a user with email "user@example.com" and password "secret" with tasks Paint the fence, Mow the lawn
    And there is a user with email "other.user@example.com" and password "secret" with tasks Walk the dog , Wash the dishes
  
  @passing
  Scenario: Task list only shows tasks for specific users
    Given I am logged in as "user@example.com" with password "secret"
    When I go to the task list
    Then I should see "Paint the fence"
    And I should see "Mow the lawn"
    And I should not see "Walk the dog"
    And I should not see "Wash Dishes"
  
  @passing
  Scenario: Creating a task on index page adds it directly to your list
    Given I am logged in as "user@example.com" with password "secret"
    When I go to the task list
    And I add a task titled "Run a race"
    Then I should be on the task list
    And I should see "Run a race"
    And I should see "Task added"