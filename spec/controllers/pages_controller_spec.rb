require 'spec_helper'

describe PagesController do
  #Las pruebas sólo se realizan en el controlador, si queremos 
  #acceso a las vistas, debemos hacer un reder_views
  
  render_views
  before(:each) do #
    # Define @base_title here.
    @base_title = "FisioApp, Fisioterapia Fisior Las palmas"
    #Nos loggueamos para empezar
    sign_in User.first

  end
  describe "GET 'home'" do 
    it "should be successful" do
      get 'home' #En este caso está solicitando /pages/home
      # status code of 200
      response.should be_success
    end 
  end
  
  it "should have the right title" do
    get 'home'
    #have_selector tomará el valor contenido dentro de las etiquetas <title> </title>
    response.should have_selector("title",:content => "|Inicio")
  end  
   
end
