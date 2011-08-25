class AddProjectPriorityToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_priority, :integer
  end
end
