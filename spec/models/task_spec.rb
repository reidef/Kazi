require 'spec_helper'

describe Task do
  it "should be valid" do
    Factory.build(:task).should be_valid
  end
end
