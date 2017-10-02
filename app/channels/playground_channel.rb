class PlaygroundChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'playground_channel'
  end

  def unsubscribed
  end

  def create_rspec_code(opts)
    @rspec_code = RspecCode.create(
      rspec: opts.fetch('rspec')
    )
  end

  def create_ruby_code(opts)
    @ruby_code = RubyCode.create(
      ruby: opts.fetch('ruby')
    )
  end

  def run_rspec
    RunRspecEventBroadcastJob.perform_now
  end
end
