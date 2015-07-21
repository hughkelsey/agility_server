class TokenController < ApplicationController
  skip_before_action :verify_authenticity_token
  include NotFound

  def show
    event = Event.find_by_event_id!(params[:id])
    render json: event
  end

  def create
    opentok_session = OPENTOK.create_session
    opentok_session_id = opentok_session.session_id

    event = Event.create_with_event_id(session_id: opentok_session_id)
    render json: event
  end

end
