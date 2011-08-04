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

end
