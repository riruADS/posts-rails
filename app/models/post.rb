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
    ActionCable.server.broadcast 'post_channel_#{current_user.id}', title: self.title
  end
end
