class Room < ApplicationRecord
  has_many :sections

  belongs_to :movie_theater
  validates :name, :capacity, presence: true
  validates :capacity, numericality: { greater_than: 0 }
end
