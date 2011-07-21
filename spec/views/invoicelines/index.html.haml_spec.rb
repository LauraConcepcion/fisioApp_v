require 'spec_helper'

describe "invoicelines/index.html.haml" do
  before(:each) do
    assign(:invoicelines, [
      stub_model(Invoiceline,
        :linenumber => 1,
        :concept => "Concept",
        :sessions => 1,
        :price => 1.5,
        :total => 1.5,
        :invoicehead_id => 1
      ),
      stub_model(Invoiceline,
        :linenumber => 1,
        :concept => "Concept",
        :sessions => 1,
        :price => 1.5,
        :total => 1.5,
        :invoicehead_id => 1
      )
    ])
  end

  it "renders a list of invoicelines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Concept".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
