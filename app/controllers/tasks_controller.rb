class TasksController < ApplicationController
  def index
    @user = current_user
    @tasks = @user.tasks
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      if @task.project
        flash[:notice] = "Task added to project."
      else
        flash[:notice] = "Task added."
      end
      redirect_to :back
    else
      redirect_to :back, :error => "Task not saved."
    end
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task
    else
      render :action => 'edit'
    end
  end
  
  def mine
    @task = Task.find(params[:id])
    @task.user = current_user
    if @task.save
      flash[:notice] = 'Task added to your list.'
    else
      flash[:error] = 'Could not add to your list.'
    end
    redirect_to :back
  end

end
