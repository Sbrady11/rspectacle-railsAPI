class RubyCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playgrounc_channel',
      test_result: %x()
    )
  end
end