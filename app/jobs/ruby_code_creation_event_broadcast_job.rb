class RubyCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(ruby_code)
    ActionCable.server.broadcast(
      'playground_channel',
      ruby: ruby_code
    )
  end
end