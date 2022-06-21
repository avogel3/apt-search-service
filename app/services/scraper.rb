class Scraper
  attr_reader :move_in_date

  def initialize(move_in_date)
    @move_in_date = Date.strptime(move_in_date, '%m/%d/%Y')
  end

  def scrape!
    raise NotImplementedError
  end

  def call
    results = scrape!

    if results.any?
      upserted = FloorPlan.upsert_all(
        results.map(&:to_h),
        unique_by: %i[name community]
      )
      puts "#{upserted.count} floor plans updated"
    end
  end
end
