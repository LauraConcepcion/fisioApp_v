require "spec_helper"

describe InvoicelinesController do
  describe "routing" do

    it "routes to #index" do
      get("/invoicelines").should route_to("invoicelines#index")
    end

    it "routes to #new" do
      get("/invoicelines/new").should route_to("invoicelines#new")
    end

    it "routes to #show" do
      get("/invoicelines/1").should route_to("invoicelines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/invoicelines/1/edit").should route_to("invoicelines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/invoicelines").should route_to("invoicelines#create")
    end

    it "routes to #update" do
      put("/invoicelines/1").should route_to("invoicelines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/invoicelines/1").should route_to("invoicelines#destroy", :id => "1")
    end

  end
end
