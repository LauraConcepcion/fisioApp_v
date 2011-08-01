require 'spec_helper'

describe PagesController do
  render_views
  before(:each) do #
  # Define @base_title here.
    @base_title = "FisioApp, Fisioterapia Fisior Las palmas"
  end
  
  describe "GET 'home'" do 
    it "should be successful" do
      get 'home'
      # status code of 200
      response.should be_success
    end 
  end
  
  it "should have the right title" do
    get 'home'
    #have_selector tomará el valor contenido dentro de las etiquetas <title> </title>
    response.should have_selector("title",:content => "FisioApp, Fisioterapia Fisior Las palmas|Inicio")
  end    
end
