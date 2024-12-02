class Movie < ApplicationRecord
  has_many :sections

  validates :title, :year, :director, :plot, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1878 }
end
