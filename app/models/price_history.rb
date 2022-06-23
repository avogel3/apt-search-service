class PriceHistory < ApplicationRecord
  belongs_to :floor_plan
  validates :price, numericality: { only_integer: true }
end
