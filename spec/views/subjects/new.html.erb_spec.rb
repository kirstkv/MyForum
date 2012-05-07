require 'spec_helper'

describe "subjects/new" do
  before(:each) do
    assign(:subject, stub_model(Subject,
      :title => "MyString",
      :description => "MyText",
      :forum => nil
    ).as_new_record)
  end

  it "renders new subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path, :method => "post" do
      assert_select "input#subject_title", :name => "subject[title]"
      assert_select "textarea#subject_description", :name => "subject[description]"
      assert_select "input#subject_forum", :name => "subject[forum]"
    end
  end
end
