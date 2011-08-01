class TasksController < ApplicationController
  def index
    @user = current_user
    @tasks = @user.tasks
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_path, :notice => "Task added."
    else
      redirect_to tasks_path, :alert => "Task not saved."
    end
  end

end
