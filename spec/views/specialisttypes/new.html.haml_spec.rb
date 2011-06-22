require 'spec_helper'

describe "specialisttypes/new.html.haml" do
  before(:each) do
    assign(:specialisttype, stub_model(Specialisttype,
      :string => ""
    ).as_new_record)
  end

  it "renders new specialisttype form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => specialisttypes_path, :method => "post" do
      assert_select "input#specialisttype_string", :name => "specialisttype[string]"
    end
  end
end
