class Dj < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :booking, dependant: :destroy

  validates :name, :price_per_day, :type, :location, :capacity, :description, presence: true
  validates :name, uniqueness: true
end
