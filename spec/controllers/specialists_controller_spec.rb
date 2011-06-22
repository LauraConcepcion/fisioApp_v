require 'spec_helper'

describe SpecialistsController do

  def mock_specialist(stubs={})
    (@mock_specialist ||= mock_model(Specialist).as_null_object).tap do |specialist|
      specialist.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all specialists as @specialists" do
      Specialist.stub(:all) { [mock_specialist] }
      get :index
      assigns(:specialists).should eq([mock_specialist])
    end
  end

  describe "GET show" do
    it "assigns the requested specialist as @specialist" do
      Specialist.stub(:find).with("37") { mock_specialist }
      get :show, :id => "37"
      assigns(:specialist).should be(mock_specialist)
    end
  end

  describe "GET new" do
    it "assigns a new specialist as @specialist" do
      Specialist.stub(:new) { mock_specialist }
      get :new
      assigns(:specialist).should be(mock_specialist)
    end
  end

  describe "GET edit" do
    it "assigns the requested specialist as @specialist" do
      Specialist.stub(:find).with("37") { mock_specialist }
      get :edit, :id => "37"
      assigns(:specialist).should be(mock_specialist)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created specialist as @specialist" do
        Specialist.stub(:new).with({'these' => 'params'}) { mock_specialist(:save => true) }
        post :create, :specialist => {'these' => 'params'}
        assigns(:specialist).should be(mock_specialist)
      end

      it "redirects to the created specialist" do
        Specialist.stub(:new) { mock_specialist(:save => true) }
        post :create, :specialist => {}
        response.should redirect_to(specialist_url(mock_specialist))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved specialist as @specialist" do
        Specialist.stub(:new).with({'these' => 'params'}) { mock_specialist(:save => false) }
        post :create, :specialist => {'these' => 'params'}
        assigns(:specialist).should be(mock_specialist)
      end

      it "re-renders the 'new' template" do
        Specialist.stub(:new) { mock_specialist(:save => false) }
        post :create, :specialist => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested specialist" do
        Specialist.should_receive(:find).with("37") { mock_specialist }
        mock_specialist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :specialist => {'these' => 'params'}
      end

      it "assigns the requested specialist as @specialist" do
        Specialist.stub(:find) { mock_specialist(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:specialist).should be(mock_specialist)
      end

      it "redirects to the specialist" do
        Specialist.stub(:find) { mock_specialist(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(specialist_url(mock_specialist))
      end
    end

    describe "with invalid params" do
      it "assigns the specialist as @specialist" do
        Specialist.stub(:find) { mock_specialist(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:specialist).should be(mock_specialist)
      end

      it "re-renders the 'edit' template" do
        Specialist.stub(:find) { mock_specialist(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested specialist" do
      Specialist.should_receive(:find).with("37") { mock_specialist }
      mock_specialist.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the specialists list" do
      Specialist.stub(:find) { mock_specialist }
      delete :destroy, :id => "1"
      response.should redirect_to(specialists_url)
    end
  end

end
