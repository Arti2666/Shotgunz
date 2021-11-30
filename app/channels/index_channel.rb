class IndexChannel < ApplicationCable::Channel
  PUBLIC_CHANNEL = "index"

  def subscribed
    # index = Index.find(params[:id])
    stream_for PUBLIC_CHANNEL
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
