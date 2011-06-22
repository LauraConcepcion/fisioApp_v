require 'spec_helper'

describe "specialisttypes/index.html.haml" do
  before(:each) do
    assign(:specialisttypes, [
      stub_model(Specialisttype,
        :string => ""
      ),
      stub_model(Specialisttype,
        :string => ""
      )
    ])
  end

  it "renders a list of specialisttypes" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
