class AddAncestryToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :ancestry, :string
    add_index :tasks, :ancestry
  end
end
