require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/' 
    response.should have_selector("title",:content => "FisioApp, Fisioterapia Fisior Las palmas|Inicio")
  end
  
end
