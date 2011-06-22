require 'spec_helper'

describe "specialists/index.html.haml" do
  before(:each) do
    assign(:specialists, [
      stub_model(Specialist,
        :type => ""
      ),
      stub_model(Specialist,
        :type => ""
      )
    ])
  end

  it "renders a list of specialists" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
