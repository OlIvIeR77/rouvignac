# encoding: UTF-8
class CalendarController < ApplicationController
  before_action :authenticate_admin!

  def index

  end

  def all_events
    all_events = []
    Gite.all.map do |gite|
      gite_events = gite.events.where("start_at >= :start OR end_at <= :end", start: params[:start_at], end: params[:end] )
      gite_events = gite_events.map{|event| {id: event.id, start: event.start_at, end: event.end_at, color: RED, title: gite.title}}
      gite_events = gite_events.sort_by{|hsh| hsh[:start]}
      previous_event_end = []
      gite_availabilities = []
      all_gite_events = []
      all_gite_events << gite_events
      # create availabilities for beginning and end of month
      unless gite_events.empty?
        if(gite_events.first[:start] - DateTime.parse(params[:start]) >= 86400)
          gite_availabilities << {start: DateTime.parse(params[:start]), end: gite_events.first[:start], color: GREEN, title: gite.title}
        end
        if((DateTime.parse(params[:end]).to_date - gite_events.last[:end].to_date).to_i >= 1)
          gite_availabilities << {start: gite_events.last[:end], end: DateTime.parse(params[:end]), color: GREEN, title: gite.title}
        end
      else
        gite_availabilities << {start: DateTime.parse(params[:start]), end: DateTime.parse(params[:end]), color: GREEN, title: gite.title}
      end
      # create availabilities between unavailabilities..
      gite_events.each_with_index do |event, i|
        previous_event_end << event[:end]
        unless i == 0
          if(event[:start] - previous_event_end[-2]) >= 86400
            gite_availabilities << {start: previous_event_end[-2], end: event[:start], color: GREEN, title: gite.title}
          end
        end
      end
      all_gite_events << gite_availabilities
      all_events << all_gite_events
    end
    #binding.pry
    render json: all_events.flatten
  end


end
