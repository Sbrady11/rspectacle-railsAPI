class RunRspecEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playground_channel',
      test_result: %x() # rspec <path>: ./public/playground/spec/<filename>
    )
  end
end
