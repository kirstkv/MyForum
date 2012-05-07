require 'spec_helper'

describe "subjects/index" do
  before(:each) do
    assign(:subjects, [
      stub_model(Subject,
        :title => "Title",
        :description => "MyText",
        :forum => nil
      ),
      stub_model(Subject,
        :title => "Title",
        :description => "MyText",
        :forum => nil
      )
    ])
  end

  it "renders a list of subjects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
