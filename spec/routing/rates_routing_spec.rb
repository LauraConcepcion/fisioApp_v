require "spec_helper"

describe RatesController do
  describe "routing" do

    it "routes to #index" do
      get("/rates").should route_to("rates#index")
    end

    it "routes to #new" do
      get("/rates/new").should route_to("rates#new")
    end

    it "routes to #show" do
      get("/rates/1").should route_to("rates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rates/1/edit").should route_to("rates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rates").should route_to("rates#create")
    end

    it "routes to #update" do
      put("/rates/1").should route_to("rates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rates/1").should route_to("rates#destroy", :id => "1")
    end

  end
end
