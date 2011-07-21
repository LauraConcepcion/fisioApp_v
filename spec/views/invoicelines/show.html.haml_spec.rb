require 'spec_helper'

describe "invoicelines/show.html.haml" do
  before(:each) do
    @invoiceline = assign(:invoiceline, stub_model(Invoiceline,
      :linenumber => 1,
      :concept => "Concept",
      :sessions => 1,
      :price => 1.5,
      :total => 1.5,
      :invoicehead_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Concept/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
