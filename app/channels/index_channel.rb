class IndexChannel < ApplicationCable::Channel
  def subscribed
    # index = Index.find(params[:id])
    stream_for "index"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
