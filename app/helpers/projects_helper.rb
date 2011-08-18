module ProjectsHelper
  def nested_tasks(tasks)
    tasks.map do |task, sub_tasks|
      render(task) + content_tag(:div, nested_tasks(sub_tasks), :class => "nested_tasks")
    end.join.html_safe
  end
end
