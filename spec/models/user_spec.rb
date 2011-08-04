require 'spec_helper'

describe User do
  it "should be valid" do
    Factory.build(:user).should be_valid
  end
  
  it "is invalid with blank email" do
    Factory.build(:user, :email => '').should_not be_valid
  end
  
  it "is invalid with blank password" do
    Factory.build(:user, :password => '').should_not be_valid
  end
  
  it "is invalid when email improperly formattted" do
    Factory.build(:user, :email => 'userexample').should_not be_valid
  end
  
  it "is required to have a unique email address" do
    Factory.create(:user, :email => 'user@example.com')
    Factory.build(:user, :email => 'user@example.com').should_not be_valid
  end
  
  it "should be authenticated with correct password" do
    user = Factory.create(:user, :password => 'secret')
    user.authenticate('secret').equal? user
  end
  
  it "should not be authenticated with incorrect password" do
    user = Factory.create(:user, :password => 'secret')
    user.authenticate('incorrect').should be false
  end
end
