class RubyCodeCreationEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(ruby_code)
    # Validation
    unless !!validateRubyCode(ruby_code)
      # Write File
      writeIntoRubyFile(ruby_code)
      # Broadcast
      broadcast('playground_channel',
                rubyCode: ruby_code.content)
    else
      broadcast('playground_channel',
                rubyCode: "Can not run restricted module")
    end
  end

  private
    def validateRubyCode(ruby_code)
      (/(require)|(File)|(IO)|(ENV)|(Dir)|(ARGVS)|(GC)|(Kernel)|(Thread)|(%x)/.match(ruby_code.content))
    end
    def writeIntoRubyFile(ruby_code)
      File.open("./public/playground/lib/code.rb","w") do |file|
        file.write(ruby_code.content)
      end
    end
    def broadcast(channel, content)
      ActionCable.server.broadcast(channel, content)
    end
end