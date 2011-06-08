require "spec_helper"

describe ClinicalhistoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/clinicalhistories" }.should route_to(:controller => "clinicalhistories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/clinicalhistories/new" }.should route_to(:controller => "clinicalhistories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/clinicalhistories/1" }.should route_to(:controller => "clinicalhistories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/clinicalhistories/1/edit" }.should route_to(:controller => "clinicalhistories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/clinicalhistories" }.should route_to(:controller => "clinicalhistories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/clinicalhistories/1" }.should route_to(:controller => "clinicalhistories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/clinicalhistories/1" }.should route_to(:controller => "clinicalhistories", :action => "destroy", :id => "1")
    end

  end
end
