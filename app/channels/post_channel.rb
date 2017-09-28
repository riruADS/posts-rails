class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'post_channel_#{current_user.id}'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def private_post
  end
  
end
