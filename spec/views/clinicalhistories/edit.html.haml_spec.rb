require 'spec_helper'

describe "clinicalhistories/edit.html.haml" do
  before(:each) do
    @clinicalhistory = assign(:clinicalhistory, stub_model(Clinicalhistory,
      :new_record? => false,
      :medicalhistory => "MyText",
      :reasonconsultation => "MyText",
      :evaluation => "MyText",
      :treatment => "MyText",
      :medicaldiagnosic => "MyString",
      :physiotherapistdiagnostic => "MyText",
      :nsessions => 1,
      :frequency => 1,
      :comments => "MyText"
    ))
  end

  it "renders the edit clinicalhistory form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => clinicalhistory_path(@clinicalhistory), :method => "post" do
      assert_select "textarea#clinicalhistory_medicalhistory", :name => "clinicalhistory[medicalhistory]"
      assert_select "textarea#clinicalhistory_reasonconsultation", :name => "clinicalhistory[reasonconsultation]"
      assert_select "textarea#clinicalhistory_evaluation", :name => "clinicalhistory[evaluation]"
      assert_select "textarea#clinicalhistory_treatment", :name => "clinicalhistory[treatment]"
      assert_select "input#clinicalhistory_medicaldiagnosic", :name => "clinicalhistory[medicaldiagnosic]"
      assert_select "textarea#clinicalhistory_physiotherapistdiagnostic", :name => "clinicalhistory[physiotherapistdiagnostic]"
      assert_select "input#clinicalhistory_nsessions", :name => "clinicalhistory[nsessions]"
      assert_select "input#clinicalhistory_frequency", :name => "clinicalhistory[frequency]"
      assert_select "textarea#clinicalhistory_comments", :name => "clinicalhistory[comments]"
    end
  end
end
