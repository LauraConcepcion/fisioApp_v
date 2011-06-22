require 'spec_helper'

describe "events/index.html.haml" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :specialist => "Specialist",
        :patient => "Patient",
        :center => "Center"
      ),
      stub_model(Event,
        :specialist => "Specialist",
        :patient => "Patient",
        :center => "Center"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Specialist".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Patient".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Center".to_s, :count => 2
  end
end
