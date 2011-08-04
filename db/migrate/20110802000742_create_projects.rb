class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_num
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
