# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
      id 1
      project_num "12345"
      name "My Project"
      location "Somewhere, USA"
    end
end