require "spec_helper"

describe InvoiceheadsController do
  describe "routing" do

    it "routes to #index" do
      get("/invoiceheads").should route_to("invoiceheads#index")
    end

    it "routes to #new" do
      get("/invoiceheads/new").should route_to("invoiceheads#new")
    end

    it "routes to #show" do
      get("/invoiceheads/1").should route_to("invoiceheads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/invoiceheads/1/edit").should route_to("invoiceheads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/invoiceheads").should route_to("invoiceheads#create")
    end

    it "routes to #update" do
      put("/invoiceheads/1").should route_to("invoiceheads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/invoiceheads/1").should route_to("invoiceheads#destroy", :id => "1")
    end

  end
end
