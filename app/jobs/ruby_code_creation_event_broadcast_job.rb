class RubyCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(ruby_code)
    # Validation
    
    # Write File
    writeIntoRubyFile(ruby_code)
    # Broadcast
    broadcast('playground_channel',
              rubyCode: ruby_code.content)
  end

  private
    def writeIntoRubyFile(ruby_code)
      File.open("./public/playground/lib/code.rb","w") do |file|
        file.write(ruby_code.content)
      end
    end
    def broadcast(channel, content)
      ActionCable.server.broadcast(channel, content)
    end
end