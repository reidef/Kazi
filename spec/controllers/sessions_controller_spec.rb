require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "logging into the site" do
    it "should redirect to task list with notice" do
      user = mock()
      User.stubs(:find_by_email).returns(user)
      user.stubs(:authenticate).returns(true)
      user.expects(:id).returns(1)
      get 'create'
      session[:user_id].should_not be_nil
      flash[:notice].should_not be_nil
      response.should redirect_to(tasks_path)
    end
    
    it "with bad password should re-render root with error" do
      user = mock
      User.stubs(:find_by_email).returns(user)
      user.stubs(:authenticate).returns(false)
      get 'create'
      session[:user_id].should be_nil
      flash.now[:alert].should_not be_nil
      response.should render_template('new')
    end
    
    it "with bad email should re-render root with error" do
      user = mock
      User.stubs(:find_by_email).returns(nil)
      user.stubs(:authenticate).returns(true)
      get 'create'
      session[:user_id].should be_nil
      flash.now[:alert].should_not be_nil
      response.should render_template('new')
    end
  end

  describe "logging out of the site" do
    it "should redirect to root url with notice" do
      user = mock
      @controller.stubs(:logged_in?).returns(user)
      session[:user_id] = 1
      get 'destroy'
      session[:user_id].should be_nil
      response.should redirect_to(root_url)
    end
  end

end
