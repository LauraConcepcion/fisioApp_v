require 'spec_helper'

describe "rates/index.html.haml" do
  before(:each) do
    assign(:rates, [
      stub_model(Rate,
        :name => "Name",
        :description => "Description",
        :sessions => 1,
        :rate => 1.5,
        :provenance_id => 1
      ),
      stub_model(Rate,
        :name => "Name",
        :description => "Description",
        :sessions => 1,
        :rate => 1.5,
        :provenance_id => 1
      )
    ])
  end

  it "renders a list of rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
