require 'spec_helper'

describe "events/edit.html.haml" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :new_record? => false,
      :specialist => "MyString",
      :patient => "MyString",
      :center => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => event_path(@event), :method => "post" do
      assert_select "input#event_specialist", :name => "event[specialist]"
      assert_select "input#event_patient", :name => "event[patient]"
      assert_select "input#event_center", :name => "event[center]"
    end
  end
end
