class UsersController < ApplicationController
  before_filter :login_required
  
  def index
    @users = current_user.admin ? User.all : current_user.organization.users
    @organization_users = @users.group_by { |user| user.organization }
  end
  
  def new
    @organization = Organization.find(params[:organization])
    @user = @organization.users.build
  end
  
  def create
    @user = User.new(params[:user])
    @user.organization = current_user.organization unless current_user.admin
    if @user.save
      redirect_to users_path, :notice => 'User created successfully.'
    else
      render 'new', :alert => 'There was an issue saving this user.'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'User updated.'
    else
      render 'edit', :alert => 'There was an issue updating this user.'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => 'User removed.'
  end
end
