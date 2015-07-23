class StreamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include NotFound

  def create
    token = OPENTOK.generate_token(event.session_id)
    stream = event.streams.create(token: token)
    stream.update_attributes(stream_params)
    render json: stream
  end

  def show
    stream = event.streams.find(params[:id])
    render json: stream
  end

  def update
    stream = event.streams.find(params[:id])
    stream.update_attributes(stream_params)
    render json: stream
  end

  private

  def event
    @event ||= Event.find_by_event_id!(params[:token_id])
  end

  def stream_params
    params.require(:stream).permit(:name)
  end

end
