Given /^there is a user with email "([^"]*)" and password "([^"]*)" with tasks (.+)$/ do |email, password, tasks|
  user = Factory(:user, :email => email, :password => password)
  tasks.split(', ').each do |task|
    Factory(:task, :title => task, :user => user)
  end
end

When /^I add a task titled "([^"]*)"$/ do |title|
  fill_in "task_title", :with => title
  click_on "Create"
end
