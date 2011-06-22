require 'spec_helper'

describe "centers/index.html.haml" do
  before(:each) do
    assign(:centers, [
      stub_model(Center,
        :name => "Name"
      ),
      stub_model(Center,
        :name => "Name"
      )
    ])
  end

  it "renders a list of centers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
