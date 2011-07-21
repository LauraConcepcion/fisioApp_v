require 'spec_helper'

describe "invoiceheads/edit.html.haml" do
  before(:each) do
    @invoicehead = assign(:invoicehead, stub_model(Invoicehead,
      :Name => "MyString",
      :FirstSurname => "MyString",
      :secondsurname => "MyString",
      :comments => "MyString"
    ))
  end

  it "renders the edit invoicehead form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoiceheads_path(@invoicehead), :method => "post" do
      assert_select "input#invoicehead_Name", :name => "invoicehead[Name]"
      assert_select "input#invoicehead_FirstSurname", :name => "invoicehead[FirstSurname]"
      assert_select "input#invoicehead_secondsurname", :name => "invoicehead[secondsurname]"
      assert_select "input#invoicehead_comments", :name => "invoicehead[comments]"
    end
  end
end
