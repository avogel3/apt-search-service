class ScrapeEvent < ApplicationRecord
  validates :scraper, :success, presence: true
end
