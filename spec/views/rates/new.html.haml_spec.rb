require 'spec_helper'

describe "rates/new.html.haml" do
  before(:each) do
    assign(:rate, stub_model(Rate,
      :name => "MyString",
      :description => "MyString",
      :sessions => 1,
      :rate => 1.5,
      :provenance_id => 1
    ).as_new_record)
  end

  it "renders new rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rates_path, :method => "post" do
      assert_select "input#rate_name", :name => "rate[name]"
      assert_select "input#rate_description", :name => "rate[description]"
      assert_select "input#rate_sessions", :name => "rate[sessions]"
      assert_select "input#rate_rate", :name => "rate[rate]"
      assert_select "input#rate_provenance_id", :name => "rate[provenance_id]"
    end
  end
end
