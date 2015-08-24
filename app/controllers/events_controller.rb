class EventsController < ApplicationController
  def create
    event_array = EventService.new.create_events(params)
    render json: event_array
    rescue StandardError => error
      render json: error, status: 422
  end
end
