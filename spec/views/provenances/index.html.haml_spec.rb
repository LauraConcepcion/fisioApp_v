require 'spec_helper'

describe "provenances/index.html.haml" do
  before(:each) do
    assign(:provenances, [
      stub_model(Provenance,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Provenance,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of provenances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
