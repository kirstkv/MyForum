require 'spec_helper'

describe "subjects/edit" do
  before(:each) do
    @subject = assign(:subject, stub_model(Subject,
      :title => "MyString",
      :description => "MyText",
      :forum => nil
    ))
  end

  it "renders the edit subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subjects_path(@subject), :method => "post" do
      assert_select "input#subject_title", :name => "subject[title]"
      assert_select "textarea#subject_description", :name => "subject[description]"
      assert_select "input#subject_forum", :name => "subject[forum]"
    end
  end
end
