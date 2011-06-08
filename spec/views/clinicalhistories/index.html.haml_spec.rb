require 'spec_helper'

describe "clinicalhistories/index.html.haml" do
  before(:each) do
    assign(:clinicalhistories, [
      stub_model(Clinicalhistory,
        :medicalhistory => "MyText",
        :reasonconsultation => "MyText",
        :evaluation => "MyText",
        :treatment => "MyText",
        :medicaldiagnosic => "Medicaldiagnosic",
        :physiotherapistdiagnostic => "MyText",
        :nsessions => 1,
        :frequency => 1,
        :comments => "MyText"
      ),
      stub_model(Clinicalhistory,
        :medicalhistory => "MyText",
        :reasonconsultation => "MyText",
        :evaluation => "MyText",
        :treatment => "MyText",
        :medicaldiagnosic => "Medicaldiagnosic",
        :physiotherapistdiagnostic => "MyText",
        :nsessions => 1,
        :frequency => 1,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of clinicalhistories" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Medicaldiagnosic".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
