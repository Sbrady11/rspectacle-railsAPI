class RspecCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(rspec_code)
    ActionCable.server.broadcast(
      'playground_channel',
      rspecCode: rspec_code.content
    )
  end
end