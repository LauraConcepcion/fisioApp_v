require 'spec_helper'

describe "provenances/new.html.haml" do
  before(:each) do
    assign(:provenance, stub_model(Provenance,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new provenance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => provenances_path, :method => "post" do
      assert_select "input#provenance_name", :name => "provenance[name]"
      assert_select "input#provenance_description", :name => "provenance[description]"
    end
  end
end
