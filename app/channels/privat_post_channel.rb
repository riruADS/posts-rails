class PrivatPostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "private_post_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
