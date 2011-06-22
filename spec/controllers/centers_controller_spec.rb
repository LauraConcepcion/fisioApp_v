require 'spec_helper'

describe CentersController do

  def mock_center(stubs={})
    (@mock_center ||= mock_model(Center).as_null_object).tap do |center|
      center.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all centers as @centers" do
      Center.stub(:all) { [mock_center] }
      get :index
      assigns(:centers).should eq([mock_center])
    end
  end

  describe "GET show" do
    it "assigns the requested center as @center" do
      Center.stub(:find).with("37") { mock_center }
      get :show, :id => "37"
      assigns(:center).should be(mock_center)
    end
  end

  describe "GET new" do
    it "assigns a new center as @center" do
      Center.stub(:new) { mock_center }
      get :new
      assigns(:center).should be(mock_center)
    end
  end

  describe "GET edit" do
    it "assigns the requested center as @center" do
      Center.stub(:find).with("37") { mock_center }
      get :edit, :id => "37"
      assigns(:center).should be(mock_center)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created center as @center" do
        Center.stub(:new).with({'these' => 'params'}) { mock_center(:save => true) }
        post :create, :center => {'these' => 'params'}
        assigns(:center).should be(mock_center)
      end

      it "redirects to the created center" do
        Center.stub(:new) { mock_center(:save => true) }
        post :create, :center => {}
        response.should redirect_to(center_url(mock_center))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved center as @center" do
        Center.stub(:new).with({'these' => 'params'}) { mock_center(:save => false) }
        post :create, :center => {'these' => 'params'}
        assigns(:center).should be(mock_center)
      end

      it "re-renders the 'new' template" do
        Center.stub(:new) { mock_center(:save => false) }
        post :create, :center => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested center" do
        Center.should_receive(:find).with("37") { mock_center }
        mock_center.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :center => {'these' => 'params'}
      end

      it "assigns the requested center as @center" do
        Center.stub(:find) { mock_center(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:center).should be(mock_center)
      end

      it "redirects to the center" do
        Center.stub(:find) { mock_center(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(center_url(mock_center))
      end
    end

    describe "with invalid params" do
      it "assigns the center as @center" do
        Center.stub(:find) { mock_center(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:center).should be(mock_center)
      end

      it "re-renders the 'edit' template" do
        Center.stub(:find) { mock_center(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested center" do
      Center.should_receive(:find).with("37") { mock_center }
      mock_center.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the centers list" do
      Center.stub(:find) { mock_center }
      delete :destroy, :id => "1"
      response.should redirect_to(centers_url)
    end
  end

end
