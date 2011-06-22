require 'spec_helper'

describe "specialists/edit.html.haml" do
  before(:each) do
    @specialist = assign(:specialist, stub_model(Specialist,
      :new_record? => false,
      :type => ""
    ))
  end

  it "renders the edit specialist form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => specialist_path(@specialist), :method => "post" do
      assert_select "input#specialist_type", :name => "specialist[type]"
    end
  end
end
