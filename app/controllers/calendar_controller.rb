# calendars are not (yet) a resource in the rails sense of thw word - we
# simply have a url like calendar/index to get the one and only calendar
# this demo serves up.
class CalendarController < ApplicationController
  def index
    #Para seleccionar el especialista
    @specialisttypes = Specialisttype.all
    @centers = Center.all    
    @event = Event.new

    end
  end
end
