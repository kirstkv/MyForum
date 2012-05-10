require 'spec_helper'

describe Subject do
  it "can be instantiated" do
    Subject.new.should be_an_instance_of(Subject)
  end
  it "can be saved successfully" do
    Subject.create.should be_persisted
  end
end
