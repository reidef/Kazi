require 'spec_helper'

describe TasksController do
  before do
    user = mock
    @controller.stubs(:logged_in?).returns(user)
  end

  describe "going to task list" do
    it "should be successful" do
      user = mock
      user.expects(:tasks).returns(mock)
      controller.stubs(:current_user).returns(user)
      get 'index'
      response.should be_success
    end
  end
  
  describe "creating a task" do
    it "successfully should redirect with notice" do
      Task.any_instance.stubs(:valid?).returns(true)
      @request.env['HTTP_REFERER'] = 'http://test.host/tasks'
      get 'create'
      assigns[:task].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(tasks_path)
    end
    
    it "failed should redirect with notice" do
      Task.any_instance.stubs(:valid?).returns(false)
      @request.env['HTTP_REFERER'] = 'http://test.host/tasks'
      get 'create'
      assigns[:task].should be_new_record
      flash[:alert].should_not be_nil
      response.should redirect_to(tasks_path)
    end
  end

end
