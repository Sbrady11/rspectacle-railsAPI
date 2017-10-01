class PlaygroundChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'playground_channel'
  end

  def unsubscribed
  end

  def create(opts)
  end
end