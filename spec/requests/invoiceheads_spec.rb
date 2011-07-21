require 'spec_helper'

describe "Invoiceheads" do
  describe "GET /invoiceheads" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get invoiceheads_path
      response.status.should be(200)
    end
  end
end
