class DataSet < ApplicationRecord
  validates :temperature, presence: true, :numericality => { greater_than_or_equal_to: -273.15 }
  validates :recorded_at, presence: true
end
