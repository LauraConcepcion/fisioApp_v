require 'spec_helper'

describe "events/new.html.haml" do
  before(:each) do
    assign(:event, stub_model(Event,
      :specialist => "MyString",
      :patient => "MyString",
      :center => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_specialist", :name => "event[specialist]"
      assert_select "input#event_patient", :name => "event[patient]"
      assert_select "input#event_center", :name => "event[center]"
    end
  end
end
