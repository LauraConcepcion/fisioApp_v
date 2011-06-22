require "spec_helper"

describe SpecialisttypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/specialisttypes" }.should route_to(:controller => "specialisttypes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/specialisttypes/new" }.should route_to(:controller => "specialisttypes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/specialisttypes/1" }.should route_to(:controller => "specialisttypes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/specialisttypes/1/edit" }.should route_to(:controller => "specialisttypes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/specialisttypes" }.should route_to(:controller => "specialisttypes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/specialisttypes/1" }.should route_to(:controller => "specialisttypes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/specialisttypes/1" }.should route_to(:controller => "specialisttypes", :action => "destroy", :id => "1")
    end

  end
end
