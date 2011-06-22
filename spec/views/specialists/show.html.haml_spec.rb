require 'spec_helper'

describe "specialists/show.html.haml" do
  before(:each) do
    @specialist = assign(:specialist, stub_model(Specialist,
      :type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
