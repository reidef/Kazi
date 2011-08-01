Given /^there is a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  user = User.create!(:email => email, :password => password)
end

Given /^I am logged in as "([^"]*)" (?:and|with) password "([^"]*)"$/ do |email, password|
  visit root_url
  fill_in("email", :with => email)
  fill_in("password", :with => password)
  click_on("Log in")
end