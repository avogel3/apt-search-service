class FloorPlan < ApplicationRecord
  has_many :price_histories
  has_one :current_price_data, -> { order(created_at: :asc) }, class_name: 'PriceHistory'

  validates :name, :community, presence: true
  validates :name, uniqueness: { scope: :community }
  validates :baths, :beds, :sq_ft, numericality: { only_integer: true }

  def price
    current_price_data.price
  end

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
