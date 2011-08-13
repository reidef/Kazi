Feature:Only allow user access to the appropriate sites
  In order to keep users from messing with other people's data
  As a site admin
  I want to require login to certain pages
  
  @passing
  Scenario Outline: User is required to be logged on pages except login
   Given I am not logged in
   When I go to <target_page>
   Then I should be on <actual_page>
   And I should <action>
   
   Examples:
    | target_page      | actual_page    | action                                               |
    | the home page    | the home page  | not see "You must be logged in to access that page." |
    | the login page   | the login page | not see "You must be logged in to access that page." |
    | the logout page  | the login page | see "You must be logged in to access that page."     |
    | the task list    | the login page | see "You must be logged in to access that page."     |
    | the project list | the login page | see "You must be logged in to access that page."     |
