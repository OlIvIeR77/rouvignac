# encoding: UTF-8
class CalendarController < ApplicationController

  def index

  end

  def all_events
    all_events = []
    Gite.all.map do |gite|
      gite_events = gite.events.where("start_at >= :start OR end_at <= :end", start: params[:start_at], end: params[:end] )
      gite_events = gite_events.map{|event| {id: event.id, start: event.start_at, end: event.end_at, color: 'red', title: gite.title}}
      all_events << gite_events
    end
    #binding.pry
    render json: all_events.flatten
  end


end
