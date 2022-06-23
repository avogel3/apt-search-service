class FloorPlan < ApplicationRecord
  has_many :price_histories

  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }
  validates :baths, :beds, :sq_ft, numericality: { only_integer: true }

  attr_readonly :price

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
