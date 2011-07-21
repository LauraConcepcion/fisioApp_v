require 'spec_helper'

describe "invoiceheads/show.html.haml" do
  before(:each) do
    @invoicehead = assign(:invoicehead, stub_model(Invoicehead,
      :Name => "Name",
      :FirstSurname => "First Surname",
      :secondsurname => "Secondsurname",
      :comments => "Comments"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Surname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Secondsurname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Comments/)
  end
end
