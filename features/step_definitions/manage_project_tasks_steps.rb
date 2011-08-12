Given /^project number "([^"]*)" has tasks? (.+)$/ do |project_num, tasks|
  project = Project.find_by_project_num(project_num)
  tasks.split(', ').each do |task|
    Factory.create(:task, :title => task, :project_id => project.id)
  end
end