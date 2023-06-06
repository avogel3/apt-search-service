class Community < ApplicationRecord
  validates :name, :floorplan_url, presence: true
end
