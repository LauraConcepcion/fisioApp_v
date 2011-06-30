class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.xml
  autocomplete :paciente, :name, :full => true, :display_value => :funky_method

end
    