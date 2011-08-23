class AddPeopleToProject < ActiveRecord::Migration
  def change
    add_column :projects, :engineer, :string
    add_column :projects, :technician, :string
  end
end
