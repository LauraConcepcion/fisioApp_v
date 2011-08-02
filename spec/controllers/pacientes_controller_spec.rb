require 'spec_helper'

describe PacientesController do
  render_views
  describe "GET 'new'" do 
    before(:each) do 
      @paciente = Factory(:paciente)
    end
    it "should be successful" do
      get 'new'
      response.should be_success
    end 
  end
  describe "GET 'show'" do
    it "should have the right title" do
      get :show, :id => @paciente
      response.should have_selector("title", :content => @paciente.name)
    end
  end
end