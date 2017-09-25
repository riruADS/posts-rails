class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable
         
  # Associations
  has_many :friendships
  has_many :posts, dependent: :destroy
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
  
  has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
  
  def friends
    active_friends | received_friends
  end
  
  def pending
      pending_friends | requested_friendships
  end
end
