class FloorPlan < ApplicationRecord
  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }
  validates :baths, :beds, :price, :sq_ft, numericality: { only_integer: true }

  def listing_status
    if updated_at <= 12.hours.ago
      :unavailable
    elsif created_at.today?
      :new
    else
      :available
    end
  end
end
