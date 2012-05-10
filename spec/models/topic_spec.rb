require 'spec_helper'

describe Topic do
  it "can be instantiated" do
    Topic.new.should be_an_instance_of(Topic)
  end
  it "can be saved successfully" do
    Topic.create.should be_persisted
  end
end
