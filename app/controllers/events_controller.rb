# encoding: utf-8
class EventsController < ApplicationController
  before_action :authenticate_admin!, except: :index

  def index
    gite = Gite.find_by(slug: params[:gite])
    @events = gite.events.where("start_at >= :start OR end_at <= :end", start: params[:start_at], end: params[:end] )
    @events = @events.map{|event| {id: event.id, start: event.start_at, end: event.end_at, color: RED, editable: true}}
    @events = @events.sort_by{|hsh| hsh[:start]}
    availabilities = []
    previous_event_end = []
    @events.each_with_index do |event, i|
      previous_event_end << event[:end]
      unless i == 0
        if(event[:start] - previous_event_end[-2]) >= 86400
          availabilities << {start: previous_event_end[-2], end: event[:start], color: GREEN}
        end
      else
        if(@events.first[:start] - DateTime.parse(params[:start]) >= 86400)
          availabilities << {start: DateTime.parse(params[:start]), end: @events.first[:start], color: GREEN}
        end
        if((DateTime.parse(params[:end]).to_date - @events.last[:end].to_date).to_i >= 1)
          availabilities << {start: @events.last[:end], end: DateTime.parse(params[:end]), color: GREEN}
        end
      end
    end
    if @events.empty?
      availabilities << {start: DateTime.parse(params[:start]), end: DateTime.parse(params[:end]), color: GREEN, title: gite.title}
    end
    @events << availabilities
    #binding.pry
    render json: @events.flatten
  end

  def create
    #binding.pry
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update_event
    gite = Gite.find_by(slug: params["gite"])
    event_object = JSON.parse params["event"]["event"]
    event = Event.find(event_object["id"])
    if event.update_attributes(params.require(:event).permit(:start_at, :end_at))
      render json: {success: 'true'}, status: 200
    else
      render json: {error: 'true'}, status: 302
    end
  end

  def delete_event
    event_object = JSON.parse params["event"]["event"]
    event = Event.find(event_object["id"])
    if event.destroy
      render json: {success: 'true'}, status: 200
    else
      render json: {error: 'true'}, status: 302
    end
  end

  private
  def current_event
    params.require(:id)
  end
  def event_params
    #binding.pry
    ep = params.require(:event).permit(:id, :name, :start_at, :end_at, :gite)
    ep[:gite] = Gite.find_by(slug: ep[:gite])
    ep
  end
end
