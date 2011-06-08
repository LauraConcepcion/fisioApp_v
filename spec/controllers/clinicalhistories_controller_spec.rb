require 'spec_helper'

describe ClinicalhistoriesController do

  def mock_clinicalhistory(stubs={})
    (@mock_clinicalhistory ||= mock_model(Clinicalhistory).as_null_object).tap do |clinicalhistory|
      clinicalhistory.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all clinicalhistories as @clinicalhistories" do
      Clinicalhistory.stub(:all) { [mock_clinicalhistory] }
      get :index
      assigns(:clinicalhistories).should eq([mock_clinicalhistory])
    end
  end

  describe "GET show" do
    it "assigns the requested clinicalhistory as @clinicalhistory" do
      Clinicalhistory.stub(:find).with("37") { mock_clinicalhistory }
      get :show, :id => "37"
      assigns(:clinicalhistory).should be(mock_clinicalhistory)
    end
  end

  describe "GET new" do
    it "assigns a new clinicalhistory as @clinicalhistory" do
      Clinicalhistory.stub(:new) { mock_clinicalhistory }
      get :new
      assigns(:clinicalhistory).should be(mock_clinicalhistory)
    end
  end

  describe "GET edit" do
    it "assigns the requested clinicalhistory as @clinicalhistory" do
      Clinicalhistory.stub(:find).with("37") { mock_clinicalhistory }
      get :edit, :id => "37"
      assigns(:clinicalhistory).should be(mock_clinicalhistory)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created clinicalhistory as @clinicalhistory" do
        Clinicalhistory.stub(:new).with({'these' => 'params'}) { mock_clinicalhistory(:save => true) }
        post :create, :clinicalhistory => {'these' => 'params'}
        assigns(:clinicalhistory).should be(mock_clinicalhistory)
      end

      it "redirects to the created clinicalhistory" do
        Clinicalhistory.stub(:new) { mock_clinicalhistory(:save => true) }
        post :create, :clinicalhistory => {}
        response.should redirect_to(clinicalhistory_url(mock_clinicalhistory))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved clinicalhistory as @clinicalhistory" do
        Clinicalhistory.stub(:new).with({'these' => 'params'}) { mock_clinicalhistory(:save => false) }
        post :create, :clinicalhistory => {'these' => 'params'}
        assigns(:clinicalhistory).should be(mock_clinicalhistory)
      end

      it "re-renders the 'new' template" do
        Clinicalhistory.stub(:new) { mock_clinicalhistory(:save => false) }
        post :create, :clinicalhistory => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested clinicalhistory" do
        Clinicalhistory.should_receive(:find).with("37") { mock_clinicalhistory }
        mock_clinicalhistory.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :clinicalhistory => {'these' => 'params'}
      end

      it "assigns the requested clinicalhistory as @clinicalhistory" do
        Clinicalhistory.stub(:find) { mock_clinicalhistory(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:clinicalhistory).should be(mock_clinicalhistory)
      end

      it "redirects to the clinicalhistory" do
        Clinicalhistory.stub(:find) { mock_clinicalhistory(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(clinicalhistory_url(mock_clinicalhistory))
      end
    end

    describe "with invalid params" do
      it "assigns the clinicalhistory as @clinicalhistory" do
        Clinicalhistory.stub(:find) { mock_clinicalhistory(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:clinicalhistory).should be(mock_clinicalhistory)
      end

      it "re-renders the 'edit' template" do
        Clinicalhistory.stub(:find) { mock_clinicalhistory(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested clinicalhistory" do
      Clinicalhistory.should_receive(:find).with("37") { mock_clinicalhistory }
      mock_clinicalhistory.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the clinicalhistories list" do
      Clinicalhistory.stub(:find) { mock_clinicalhistory }
      delete :destroy, :id => "1"
      response.should redirect_to(clinicalhistories_url)
    end
  end

end
