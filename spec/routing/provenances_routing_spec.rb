require "spec_helper"

describe ProvenancesController do
  describe "routing" do

    it "routes to #index" do
      get("/provenances").should route_to("provenances#index")
    end

    it "routes to #new" do
      get("/provenances/new").should route_to("provenances#new")
    end

    it "routes to #show" do
      get("/provenances/1").should route_to("provenances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/provenances/1/edit").should route_to("provenances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/provenances").should route_to("provenances#create")
    end

    it "routes to #update" do
      put("/provenances/1").should route_to("provenances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/provenances/1").should route_to("provenances#destroy", :id => "1")
    end

  end
end
