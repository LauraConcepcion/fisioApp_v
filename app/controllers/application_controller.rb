class ApplicationController < ActionController::Base
  protect_from_forgery
  #indicamos qué se puede mostrar o no sin auntentificación
  #before_filter  :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_user!
end
