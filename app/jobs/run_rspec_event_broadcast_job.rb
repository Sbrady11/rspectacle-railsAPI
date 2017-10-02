class RunRspecEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playground_channel',
      testResult: %x(rspec ./public/playground/spec/code_spec.rb)
    )
  end
end
