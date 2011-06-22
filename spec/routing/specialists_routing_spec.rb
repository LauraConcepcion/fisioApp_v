require "spec_helper"

describe SpecialistsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/specialists" }.should route_to(:controller => "specialists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/specialists/new" }.should route_to(:controller => "specialists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/specialists/1" }.should route_to(:controller => "specialists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/specialists/1/edit" }.should route_to(:controller => "specialists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/specialists" }.should route_to(:controller => "specialists", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/specialists/1" }.should route_to(:controller => "specialists", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/specialists/1" }.should route_to(:controller => "specialists", :action => "destroy", :id => "1")
    end

  end
end
