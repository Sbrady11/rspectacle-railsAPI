class RspecCode < ApplicationRecord
  after_create_commit do
    RspecCodeCreationEventBroadcastJob.perform_later(self)
  end
end
