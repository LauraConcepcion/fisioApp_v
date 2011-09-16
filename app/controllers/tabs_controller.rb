class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  autocomplete :paciente, :name, :extra_date => [:firstsurname], :full => true, :display_value => :funky_method
  autocomplete :paciente, :firstsurname, :full => true, :display_value => :funky_method
  autocomplete :paciente, :secondsurname, :full => true, :display_value => :funky_method
  autocomplete :paciente, :idcode, :full => true, :display_value => :funky_method
  
  autocomplete :brand, :name, :extra_data => [:slogan]
end
    