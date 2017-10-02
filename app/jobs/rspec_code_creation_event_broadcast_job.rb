class RspecCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(rspec_code)
    ActionCable.server.broadcast(
      'playground_channel',
      rspec: rspec_code
    )
  end
end