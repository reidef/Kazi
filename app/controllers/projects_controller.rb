class ProjectsController < ApplicationController
  before_filter :login_required
  
  def index
    @organization = current_user.organization
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
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => 'Project updated.'
    else
      render 'edit', :alert => 'There was a problem saving your changes.'
    end
  end
end
