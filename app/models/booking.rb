class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dj
  has_many :reviews

  validates :date_begin, :date_end, :user_id, :dj_id, presence: true
end
