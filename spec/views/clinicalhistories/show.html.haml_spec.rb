require 'spec_helper'

describe "clinicalhistories/show.html.haml" do
  before(:each) do
    @clinicalhistory = assign(:clinicalhistory, stub_model(Clinicalhistory,
      :medicalhistory => "MyText",
      :reasonconsultation => "MyText",
      :evaluation => "MyText",
      :treatment => "MyText",
      :medicaldiagnosic => "Medicaldiagnosic",
      :physiotherapistdiagnostic => "MyText",
      :nsessions => 1,
      :frequency => 1,
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Medicaldiagnosic/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
