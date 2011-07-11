require 'spec_helper'

describe "provenances/edit.html.haml" do
  before(:each) do
    @provenance = assign(:provenance, stub_model(Provenance,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit provenance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => provenances_path(@provenance), :method => "post" do
      assert_select "input#provenance_name", :name => "provenance[name]"
      assert_select "input#provenance_description", :name => "provenance[description]"
    end
  end
end
