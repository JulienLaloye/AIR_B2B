class Dj < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, :price_per_day, :genre, :location, :capacity, :description, presence: true
  validates :name, uniqueness: true
end
