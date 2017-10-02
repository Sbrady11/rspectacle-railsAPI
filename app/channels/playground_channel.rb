class PlaygroundChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'playground_channel'
  end

  def unsubscribed
  end

  def create_rspec_code(opts)
    @rspec_code = RspecCode.create(
      content: opts.fetch('content')
    )
    # does this belong here?
    rspecCode = "require 'code'\n#{@rspec_code.content}" 
    puts opts.fetch('content')
    File.open("./public/playground/spec/code_spec.rb","w") do |file|
      file.write(rspecCode) 
    end
  end

  def create_ruby_code(opts)
    @ruby_code = RubyCode.create(
      content: opts.fetch('content')
    )
    # does this belong here?
    File.open("./public/playground/lib/code.rb","w") do |file|
      file.write(opts.fetch('content'))  
    end
  end

  def run_rspec
    RunRspecEventBroadcastJob.perform_now
  end
end
