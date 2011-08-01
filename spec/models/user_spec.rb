require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end
  
  it "should be valid" do
    @user = User.new({:email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret'})
    @user.should be_valid
  end
  
  it "is invalid with blank email" do
    @user = User.new({:email => '', :password => 'secret', :password_confirmation => 'secret'})
    @user.should_not be_valid
  end
  
  it "is invalid with blank password" do
    @user = User.new({:email => 'user@example.com', :password => '', :password_confirmation => ''})
    @user.should_not be_valid
  end
  
  it "is invalid when email improperly formattted" do
    @user = User.new({:email => 'userexample', :password => 'secret', :password_confirmation => 'secret'})
    @user.should_not be_valid
  end
  
  it "is required to have a unique email address" do
    User.create!({:email => 'user@example.com', :password => 'secret', :password_confirmation => 'secret'})
    @user = User.new({:email => 'user@example.com', :password => 'secret1', :password_confirmation => 'secret1'})
    @user.should_not be_valid
  end
end
