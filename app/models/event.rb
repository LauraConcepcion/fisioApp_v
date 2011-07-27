# == Schema Information
# Schema version: 20110727171746
#
# Table name: events
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  starts_at          :datetime
#  ends_at            :datetime
#  all_day            :boolean
#  description        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  center_id          :integer
#  specialist_id      :integer
#  attended           :boolean
#  paciente_id        :integer
#  invoiceline_id     :integer
#  clinicalhistory_id :integer
#

class Event < ActiveRecord::Base
  attr_accessible  :starts_at, :ends_at, :all_day, :description, :center_id, :specialist_id, :paciente_id,:attended, :invoiceline_id, :clinicalhistory
 
  belongs_to  :center
  belongs_to  :specialist
  belongs_to  :paciente
  has_one     :invoiceline
  belongs_to  :clinicalhistory
  
  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
  scope :filter_c, lambda {|center_id| where(:center_id => center_id)}
  scope :filter_s, lambda {|specialist_id| where(:specialist_id => specialist_id)}
  scope :filter_p, lambda {|paciente_id| where(:paciente_id => paciente_id)}
  
  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description,
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :allDay => self.all_day,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id),
      :center_id => self.center_id,
      :attended => self.attended,
      :paciente_id => self.paciente_id,
      :specialist_is => self.specialist_id,
    }
    
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['center_id = ?', search])
    else
      find(:all)
    end
  end
  def fulldescription
      "#{self.specialist.name}, #{self.center.name}"
  end

end
