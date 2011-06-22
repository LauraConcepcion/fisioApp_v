require 'spec_helper'

describe "specialisttypes/show.html.haml" do
  before(:each) do
    @specialisttype = assign(:specialisttype, stub_model(Specialisttype,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
