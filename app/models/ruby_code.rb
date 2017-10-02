class RubyCode < ApplicationRecord
  after_create_commit do
    RubyCodeCreationEventBroadcastJob.perform_later(self)
  end
end