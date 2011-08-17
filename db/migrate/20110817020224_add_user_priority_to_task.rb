class AddUserPriorityToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :user_priority, :integer
  end
end
