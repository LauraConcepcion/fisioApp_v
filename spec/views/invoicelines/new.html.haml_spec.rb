require 'spec_helper'

describe "invoicelines/new.html.haml" do
  before(:each) do
    assign(:invoiceline, stub_model(Invoiceline,
      :linenumber => 1,
      :concept => "MyString",
      :sessions => 1,
      :price => 1.5,
      :total => 1.5,
      :invoicehead_id => 1
    ).as_new_record)
  end

  it "renders new invoiceline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoicelines_path, :method => "post" do
      assert_select "input#invoiceline_linenumber", :name => "invoiceline[linenumber]"
      assert_select "input#invoiceline_concept", :name => "invoiceline[concept]"
      assert_select "input#invoiceline_sessions", :name => "invoiceline[sessions]"
      assert_select "input#invoiceline_price", :name => "invoiceline[price]"
      assert_select "input#invoiceline_total", :name => "invoiceline[total]"
      assert_select "input#invoiceline_invoicehead_id", :name => "invoiceline[invoicehead_id]"
    end
  end
end
