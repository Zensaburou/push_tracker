class EventsController < ApplicationController
  def create
    EventService.new.create_events(params)
    render nothing: true
  end
end
