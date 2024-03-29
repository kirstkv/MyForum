require 'spec_helper'

describe "forums/index" do
  before(:each) do
    assign(:forums, [
      stub_model(Forum,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Forum,
        :name => "Name",
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of forums" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
