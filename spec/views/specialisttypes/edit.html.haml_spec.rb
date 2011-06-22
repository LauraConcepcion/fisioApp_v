require 'spec_helper'

describe "specialisttypes/edit.html.haml" do
  before(:each) do
    @specialisttype = assign(:specialisttype, stub_model(Specialisttype,
      :new_record? => false,
      :string => ""
    ))
  end

  it "renders the edit specialisttype form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => specialisttype_path(@specialisttype), :method => "post" do
      assert_select "input#specialisttype_string", :name => "specialisttype[string]"
    end
  end
end
