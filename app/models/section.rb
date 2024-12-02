class Section < ApplicationRecord
  belongs_to :movie
  belongs_to :room

  validates :week_day, :time, presence: true
  validates :week_day, inclusion: { in: 0..6 }
end
