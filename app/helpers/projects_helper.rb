module ProjectsHelper
  def nested_tasks(tasks)
    tasks.map do |task, sub_tasks|
      content_tag(:li, render(task) + content_tag(:ul, nested_tasks(sub_tasks)), :id => 'tasks_' + task.id.to_s)
    end.join.html_safe
  end
end
