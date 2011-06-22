require 'spec_helper'

describe "specialists/new.html.haml" do
  before(:each) do
    assign(:specialist, stub_model(Specialist,
      :type => ""
    ).as_new_record)
  end

  it "renders new specialist form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => specialists_path, :method => "post" do
      assert_select "input#specialist_type", :name => "specialist[type]"
    end
  end
end
