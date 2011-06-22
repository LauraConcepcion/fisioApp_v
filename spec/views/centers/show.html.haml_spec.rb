require 'spec_helper'

describe "centers/show.html.haml" do
  before(:each) do
    @center = assign(:center, stub_model(Center,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
