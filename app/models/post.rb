class Post < ApplicationRecord
  # Associations
  belongs_to :user
  
  # Associations validations
  validates :user, presence: true
  
  # Fields validations
  validates :title, presence: true
  validates :is_private, presence: true
end
