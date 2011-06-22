require 'spec_helper'

describe SpecialisttypesController do

  def mock_specialisttype(stubs={})
    (@mock_specialisttype ||= mock_model(Specialisttype).as_null_object).tap do |specialisttype|
      specialisttype.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all specialisttypes as @specialisttypes" do
      Specialisttype.stub(:all) { [mock_specialisttype] }
      get :index
      assigns(:specialisttypes).should eq([mock_specialisttype])
    end
  end

  describe "GET show" do
    it "assigns the requested specialisttype as @specialisttype" do
      Specialisttype.stub(:find).with("37") { mock_specialisttype }
      get :show, :id => "37"
      assigns(:specialisttype).should be(mock_specialisttype)
    end
  end

  describe "GET new" do
    it "assigns a new specialisttype as @specialisttype" do
      Specialisttype.stub(:new) { mock_specialisttype }
      get :new
      assigns(:specialisttype).should be(mock_specialisttype)
    end
  end

  describe "GET edit" do
    it "assigns the requested specialisttype as @specialisttype" do
      Specialisttype.stub(:find).with("37") { mock_specialisttype }
      get :edit, :id => "37"
      assigns(:specialisttype).should be(mock_specialisttype)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created specialisttype as @specialisttype" do
        Specialisttype.stub(:new).with({'these' => 'params'}) { mock_specialisttype(:save => true) }
        post :create, :specialisttype => {'these' => 'params'}
        assigns(:specialisttype).should be(mock_specialisttype)
      end

      it "redirects to the created specialisttype" do
        Specialisttype.stub(:new) { mock_specialisttype(:save => true) }
        post :create, :specialisttype => {}
        response.should redirect_to(specialisttype_url(mock_specialisttype))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved specialisttype as @specialisttype" do
        Specialisttype.stub(:new).with({'these' => 'params'}) { mock_specialisttype(:save => false) }
        post :create, :specialisttype => {'these' => 'params'}
        assigns(:specialisttype).should be(mock_specialisttype)
      end

      it "re-renders the 'new' template" do
        Specialisttype.stub(:new) { mock_specialisttype(:save => false) }
        post :create, :specialisttype => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested specialisttype" do
        Specialisttype.should_receive(:find).with("37") { mock_specialisttype }
        mock_specialisttype.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :specialisttype => {'these' => 'params'}
      end

      it "assigns the requested specialisttype as @specialisttype" do
        Specialisttype.stub(:find) { mock_specialisttype(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:specialisttype).should be(mock_specialisttype)
      end

      it "redirects to the specialisttype" do
        Specialisttype.stub(:find) { mock_specialisttype(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(specialisttype_url(mock_specialisttype))
      end
    end

    describe "with invalid params" do
      it "assigns the specialisttype as @specialisttype" do
        Specialisttype.stub(:find) { mock_specialisttype(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:specialisttype).should be(mock_specialisttype)
      end

      it "re-renders the 'edit' template" do
        Specialisttype.stub(:find) { mock_specialisttype(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested specialisttype" do
      Specialisttype.should_receive(:find).with("37") { mock_specialisttype }
      mock_specialisttype.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the specialisttypes list" do
      Specialisttype.stub(:find) { mock_specialisttype }
      delete :destroy, :id => "1"
      response.should redirect_to(specialisttypes_url)
    end
  end

end
