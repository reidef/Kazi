require 'spec_helper'

describe ProjectsController do

  describe "going to the project list" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "viewing task details" do
    it "should be successful" do
      project = mock
      Project.stubs(:find).returns(project)
      get 'show', :id => 1
      response.should be_success
    end
  end
  
  describe "going to the new project page" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "creating a task" do
    it "successfully should redirect with notice" do
      Project.any_instance.stubs(:valid?).returns(true)
      get 'create'
      assigns[:project].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(projects_path)
    end
    
    it "failed should redirect with notice" do
      Project.any_instance.stubs(:valid?).returns(false)
      get 'create'
      assigns[:project].should be_new_record
      flash[:alert].should_not be_nil
      response.should redirect_to(projects_path)
    end
  end
end
