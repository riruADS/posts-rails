class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'post_channel'
  end

  def unsubscribed
  end
end
