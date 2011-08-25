class TasksController < ApplicationController
  before_filter :login_required
  
  def index
    @user = current_user
    @tasks = @user.tasks
  end
  
  def new
    @parent = Task.find(params[:parent_id])
    @task = Task.new(:parent_id => @parent.id, :project_id => @parent.project_id)
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
      redirect_to :back, :alert => "Task not saved."
    end
  end
  
  def edit
    @task = Task.find(params[:id])
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
      Task.find(id).update_attributes(:user_priority => index + 1)
    end
    render :nothing => true
  end
  
  def nest
    params[:tasks].each_with_index do |(task_id,parent_id), index|
      parent_id = nil if parent_id == "root"
      Task.find(task_id).update_attributes(:parent_id => parent_id)
    end
    render :nothing => true
  end
  
  def daily
    @user = current_user
    @tasks = @user.tasks
  end

end