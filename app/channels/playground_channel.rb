class PlaygroundChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'playground_channel'
  end

  def unsubscribed
    if ActionCable.server.connections.length == 0
      File.open("./public/playground/spec/code_spec.rb","w") do |file|
        file.write('')
      end
      File.open("./public/playground/lib/code.rb","w") do |file|
        file.write('')
      end
    end
  end

  def create_rspec_code(opts)
    @rspec_code = RspecCode.create(
      content: opts.fetch('content')
    )
  end

  def create_ruby_code(opts)
    @ruby_code = RubyCode.create(
      content: opts.fetch('content')
    )
  end

  def run_rspec
    RunRspecEventBroadcastJob.perform_now
  end
end
