class Event < ActiveRecord::Base
	attr_accessible :end_at, :name, :start_at, :color
  	has_event_calendar
end
