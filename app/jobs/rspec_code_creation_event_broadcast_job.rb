class RspecCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(rspec_code)
    # Write File
    writeIntoSpecFile(rspec_code)
    # Broadcast
    broadcast('playground_channel',
              rspecCode: rspec_code.content)
  end

  private
    def writeIntoSpecFile(rspec_code)
      path = '"../lib/code"'
      spec = "require_relative #{path}\n#{rspec_code.content}"
      File.open("./public/playground/spec/code_spec.rb","w") do |file|
        file.write(spec)
      end
    end
    def broadcast(channel, content)
      ActionCable.server.broadcast(channel, content)
    end
end