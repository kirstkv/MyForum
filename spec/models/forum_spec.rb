require 'spec_helper'

describe Forum do
  
  it "can be instantiated" do
    Forum.new.should be_an_instance_of(Forum)
  end
  it "can be saved successfully" do
    Forum.create.should be_persisted
  end
  
end
