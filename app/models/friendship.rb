class Friendship < ApplicationRecord
  # Associations
  
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
