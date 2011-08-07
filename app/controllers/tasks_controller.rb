class TasksController < ApplicationController
  def index
    @user = current_user
    @tasks = @user.tasks
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      if @task.project
        redirect_to @task.project, :notice => "Task added to project."
      else
        redirect_to tasks_path, :notice => "Task added."
      end
    else
      redirect_to tasks_path, :alert => "Task not saved."
    end
  end

end
