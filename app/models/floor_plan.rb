class FloorPlan < ApplicationRecord
  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }
  validates :baths, :beds, :price, :sq_ft, numericality: { only_integer: true }
end
