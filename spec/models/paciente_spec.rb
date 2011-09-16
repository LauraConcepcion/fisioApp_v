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
  
  it "should reject :name, :firstsurname, :secondsurname, :profession, :email, that are too long" do
    long_name = "a" * 101 
    long_name_paciente = Paciente.new(@attr.merge(:name => long_name, :firstsurname => long_name, :secondsurname => long_name, :profession => long_name, :email => long_name)) 
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
  it "se debe validar el formato del dni correcto" do
    codes = %w[42192561G 42192561f] 
    codes.each do |codes|
      valid_code_paciente = Paciente.new(@attr.merge(:idcode => codes))
      valid_code_paciente.should be_valid
    end
  end  
  it "se debe invalidar el formato del dni incorrecto" do
    codes = %w[42192561-G a2192561f aaaaaaaaa 233454322 22 ] 
    codes.each do |codes|
      valid_code_paciente = Paciente.new(@attr.merge(:idcode => codes))
      valid_code_paciente.should_not be_valid
    end
  end 
  it "se puede dejar en blanco el dni" do
    @attr = { :name => "Example paciente", :firstsurname => "Example Firstname",:email => "paciente@example.com" }
    paciente = Paciente.new(@attr) 
    paciente.should be_valid
  end 
  it "se puede dejar en blanco el mail" do
    @attr = { :name => "Example paciente", :firstsurname => "Example Firstname" }
    paciente = Paciente.new(@attr) 
    paciente.should be_valid
  end 
  
  
  it "se debe validar el formato del cumpleanos correcto" do
    birthdates = %w[1984-03-19 84-03-19] 
    birthdates.each do |birthdates|
      valid_birthdate_paciente = Paciente.new(@attr.merge(:birthdate => birthdates))
      valid_birthdate_paciente.should be_valid
    end
  end  
  it "se debe invalidar el formato del dni incorrecto" do
    birthdates = %w[1984/3/19 84.03.19 1984-25-99] 
    birthdates.each do |birthdates|
      valid_birthdate_paciente = Paciente.new(@attr.merge(:birthdate => birthdates))
      valid_birthdate_paciente.should_not be_valid
    end
  end 
  it "se puede dejar en blanco el dni" do
    @attr = { :name => "Example paciente", :firstsurname => "Example Firstname"}
    paciente = Paciente.new(@attr) 
    paciente.should be_valid
  end 

end