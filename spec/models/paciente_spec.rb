require 'spec_helper' 
describe Paciente do
  before(:each) do 
    @attr = { :name => "Example paciente", :firstsurname => "Example Firstname",:email => "paciente@example.com", :idcode=> "42222222g" }
  end
  it "should create a new instance given valid attributes" do 
    Paciente.create!(@attr)
  end
  it "should require a name" do
    no_name_paciente = Paciente.new(@attr.merge(:name => ""))
    no_name_paciente.should_not be_valid
  end
  it "should require a firstsurname" do
    no_name_firstsurname = Paciente.new(@attr.merge(:firstsurname => ""))
    no_name_firstsurname.should_not be_valid
  end
  it "should reject names that are too long" do
    long_name = "a" * 101 
    long_name_paciente = Paciente.new(@attr.merge(:name => long_name)) 
    long_name_paciente.should_not be_valid
  end
  it "should accept valid email addresses" do
    addresses = %w[Paciente@foo.com THE_Paciente@foo.bar.org first.last@foo.jp] 
    addresses.each do |address|
      valid_email_paciente = Paciente.new(@attr.merge(:email => address))
      valid_email_paciente.should be_valid
    end
  end 
  it "should reject invalid email addresses" do 
    addresses = %w[Paciente@foo,com Paciente_at_foo.org example.Paciente@foo.] 
    addresses.each do |address|
      invalid_email_paciente = Paciente.new(@attr.merge(:email => address))
      invalid_email_paciente.should_not be_valid
    end
  end 
  it "should reject duplicate idcode " do
  # Put a Paciente with given email address into the database.
    Paciente.create!(@attr) 
    paciente_with_duplicate_idcode = Paciente.new(@attr) 
    paciente_with_duplicate_idcode.should_not be_valid
  end
  
  it "should reject idcode  identical up to case" do
    upcased_idcode = @attr[:idcode].upcase 
    Paciente.create!(@attr.merge(:idcode => upcased_idcode)) 
    paciente_with_duplicate_idcode = Paciente.new(@attr) 
    paciente_with_duplicate_idcode.should_not be_valid
  end
  
end