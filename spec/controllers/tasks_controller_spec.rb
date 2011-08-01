require 'spec_helper'

describe TasksController do

  describe "going to task list" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
