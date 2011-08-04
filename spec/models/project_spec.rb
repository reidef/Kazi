require 'spec_helper'

describe Project do
  it "should be valid" do
    Factory.build(:project).should be_valid
  end
end
