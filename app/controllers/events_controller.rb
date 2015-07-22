class EventsController < ApplicationController
  def index
    redirect_to event_path(params[:id]) and return if params[:id]
  end

  def show
    @event = Event.find_by_event_id!(params[:id])
    @token = OPENTOK.generate_token @event.session_id, role: :moderator
  end

  def create
    opentok_session = OPENTOK.create_session
    opentok_session_id = opentok_session.session_id

    event = Event.create_with_event_id(session_id: opentok_session_id)
    redirect_to event
  end

  def stream
    @event = Event.find_by_event_id!(params[:id])
    @token = OPENTOK.generate_token @event.session_id, role: :moderator
    @stream_id = params[:stream_id]
  end
end
