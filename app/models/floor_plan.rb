class FloorPlan < ApplicationRecord
  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }

  def price_as_number
    price.gsub(/\D+/, '')
  end
end
