class Room < ApplicationRecord
  belongs_to :movie_theater
  has_many :sections

  validates :name, :capacity, presence: true
  validates :capacity, numericality: { greater_than: 0 }
end
