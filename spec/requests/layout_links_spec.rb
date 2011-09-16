require 'spec_helper'

describe "LayoutLinks" do
  it "should have the right links on the layout" do
    visit root_path 
    click_link "Citas" 
    response.should have_selector('title', :content => "Nuevo paciente") 
  end
end
