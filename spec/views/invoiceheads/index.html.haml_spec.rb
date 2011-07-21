require 'spec_helper'

describe "invoiceheads/index.html.haml" do
  before(:each) do
    assign(:invoiceheads, [
      stub_model(Invoicehead,
        :Name => "Name",
        :FirstSurname => "First Surname",
        :secondsurname => "Secondsurname",
        :comments => "Comments"
      ),
      stub_model(Invoicehead,
        :Name => "Name",
        :FirstSurname => "First Surname",
        :secondsurname => "Secondsurname",
        :comments => "Comments"
      )
    ])
  end

  it "renders a list of invoiceheads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Surname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Secondsurname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Comments".to_s, :count => 2
  end
end
