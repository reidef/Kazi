class ProjectsController < ApplicationController
  before_filter :login_required
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    @project.organization = current_user.organization
    if @project.save
      redirect_to projects_path, :notice => "Project added."
    else
      redirect_to projects_path, :alert => "Project not saved."
    end
  end

end
