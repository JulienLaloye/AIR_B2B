class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  
  validates :rating, :comment, :booking_id, :user_id, :type_of_review, presence: true
end
