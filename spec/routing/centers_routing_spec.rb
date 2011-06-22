require "spec_helper"

describe CentersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/centers" }.should route_to(:controller => "centers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/centers/new" }.should route_to(:controller => "centers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/centers/1" }.should route_to(:controller => "centers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/centers/1/edit" }.should route_to(:controller => "centers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/centers" }.should route_to(:controller => "centers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/centers/1" }.should route_to(:controller => "centers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/centers/1" }.should route_to(:controller => "centers", :action => "destroy", :id => "1")
    end

  end
end
