class Post < ApplicationRecord
  # Callback
  after_commit :broadcast_request, on: :create
  
  # Associations
  belongs_to :user
  
  # Associations validations
  validates :user, presence: true
  
  # Fields validations
  validates :title, presence: true
  
  def broadcast_request
    if self.is_private
      self.user.friends.each do |friend|
        ActionCable.server.broadcast "private_post_channel_#{friend.id}", title: self.title
      end
    else
      ActionCable.server.broadcast 'post_channel', title: self.title
    end
  end
end
