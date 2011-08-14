class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      redirect_to users_path, :notice => "Organization created."
    else
      render 'new', :alert => "Could not save."
    end
  end
  
  def edit
    @organization = Organization.find(params[:id])
  end
  
  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      redirect_to users_path, :notice => "Organization updated."
    else
      render 'edit', :alert => "Could not update."
    end
  end
end
