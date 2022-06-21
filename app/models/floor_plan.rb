class FloorPlan < ApplicationRecord
  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }
end
