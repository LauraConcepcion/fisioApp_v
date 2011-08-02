require 'spec_helper'

describe Center do
  before(:each) do 
    @attr = { :name => "Example center" }
  end  
  
  it "should create a new instance given valid attributes" do 
    Center.create!(@attr)
  end  
  it "should require a name" do
    no_name_center = Center.new(@attr.merge(:name => ""))
    no_name_center.should_not be_valid
  end
  it "should reject names that are too long" do
    long_name = "a" * 81 
    long_name_center = Center.new(@attr.merge(:name => long_name)) 
    long_name_center.should_not be_valid
  end 
  
  it "should reject duplicate name " do
  # Put a Paciente with given email address into the database.
    Center.create!(@attr) 
    center_with_duplicate_idcode = Center.new(@attr) 
    center_with_duplicate_idcode.should_not be_valid
  end

end
