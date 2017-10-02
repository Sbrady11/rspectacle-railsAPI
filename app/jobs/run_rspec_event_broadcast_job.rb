class RunRspecEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playground_channel',
      testResult: %x(rspec) # rspec <path>: ./public/playground/spec/<filename>
    )
  end
end
