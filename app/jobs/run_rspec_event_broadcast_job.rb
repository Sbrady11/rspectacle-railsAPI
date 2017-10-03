class RunRspecEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playground_channel',
      testResult: testResult
    )
  end
  private
    def testResult
      p %x(rspec ./public/playground/spec/code_spec.rb --format j)
    end
end
