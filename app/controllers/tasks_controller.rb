class TasksController < ApplicationController
  before_filter :login_required
  
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
      redirect_to :back, :alert => "Task not saved."
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
  
  def complete
    Task.update_all({:completed_at => Time.now}, :id => params[:task_ids])
    redirect_to tasks_path, :notce => 'Task marked complete.'
  end
  
  def uncomplete
    Task.update_all({:completed_at => nil}, :id => params[:task_ids])
    redirect_to tasks_path, :notice => 'Task returned to your list.'
  end
  
  def prioritize
    params[:tasks].each_with_index do |id, index|
      Task.update_all({:user_priority => index+1}, :id => id)
    end
    render :nothing => true
  end

end
