require 'spec_helper'
#incluimos los helper de devise para la autentificación

describe PacientesController do
  render_views
  before(:each) do
    sign_in User.first
  end
  
  describe "GET 'new'" do 
    before(:each) do 
      @paciente = Factory(:paciente)
    end
    it "should be successful" do
      get 'new'
      response.should be_success
    end 
    it "should have the right title" do
      get 'new'
      #have_selector tomará el valor contenido dentro de las etiquetas <title> </title>
      response.should have_selector("title",:content => "|Nuevo paciente")
    end 
  end
  
  #No deberían existir
  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end
end