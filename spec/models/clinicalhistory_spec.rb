require 'spec_helper'

describe Clinicalhistory do
  before(:each) do 
    @attr = { :paciente_id => 1 }
  end  
  
  it "should create a new instance given valid attributes" do 
    Clinicalhistory.create!(@attr)
  end  
  it "should require a name" do
    no_name_clinicalhistory = Clinicalhistory.new(@attr.merge(:name => ""))
    no_name_clinicalhistory.should_not be_valid
  end
  it "should reject names that are too long" do
    long_name = "a" * 81 
    long_name_clinicalhistory = Clinicalhistory.new(@attr.merge(:name => long_name)) 
    long_name_clinicalhistory.should_not be_valid
  end 
  
  it "should reject duplicate name " do
  # Put a Paciente with given email address into the database.
    Clinicalhistory.create!(@attr) 
    clinicalhistory_with_duplicate_idcode = Clinicalhistory.new(@attr) 
    clinicalhistory_with_duplicate_idcode.should_not be_valid
  end
end
