class StreamsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include NotFound

  def create
    stream = event.streams.create(stream_params)
    render json: stream
  end

  def show
    render json: stream
  end

  def update
    stream.update_attributes(stream_params)
    render json: stream
  end

  private

  def event
    @event ||= Event.find_by_event_id!(params[:token_id])
  end

  def stream
    @stream ||= event.streams.find_by_stream_id!(params[:id])
  end

  def stream_params
    params.require(:stream).permit(:name, :stream_id)
  end

end
