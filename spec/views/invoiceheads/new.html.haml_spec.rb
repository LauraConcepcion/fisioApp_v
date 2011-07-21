require 'spec_helper'

describe "invoiceheads/new.html.haml" do
  before(:each) do
    assign(:invoicehead, stub_model(Invoicehead,
      :Name => "MyString",
      :FirstSurname => "MyString",
      :secondsurname => "MyString",
      :comments => "MyString"
    ).as_new_record)
  end

  it "renders new invoicehead form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoiceheads_path, :method => "post" do
      assert_select "input#invoicehead_Name", :name => "invoicehead[Name]"
      assert_select "input#invoicehead_FirstSurname", :name => "invoicehead[FirstSurname]"
      assert_select "input#invoicehead_secondsurname", :name => "invoicehead[secondsurname]"
      assert_select "input#invoicehead_comments", :name => "invoicehead[comments]"
    end
  end
end
