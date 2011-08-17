class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  scope :todo, where("tasks.completed_at IS NULL")
  scope :complete, where("tasks.completed_at IS NOT NULL").order("tasks.completed_at DESC")
end
