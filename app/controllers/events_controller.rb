# encoding: utf-8
class EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    #binding.pry
    gite = Gite.find_by(slug: params[:gite])
    @events = gite.events.where("start_at >= :current_year", current_year: Date.today.year)
    @events = @events.map{|event| {id: event.id, start: event.start_at, end: event.end_at, color: 'red'}}
    render json: @events
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
