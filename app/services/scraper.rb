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
        returning: [:id],
        unique_by: %i[name community]
      )

      if upserted.any?
        upserted.zip(results).map do |upserted, fp|
          fp_id = upserted['id']
          return unless fp.price.present?

          ph = PriceHistory.find_or_create_by(floor_plan_id: fp_id, price: fp.price)
          ph.touch unless ph.new_record?
        end
      end

      audit!(success: true)
      puts "#{upserted.count} floor plans updated"
    end
  rescue StandardError => e
    audit!(success: false)
    raise e
  end

  def audit!(success:)
    ScrapeEvent.new(success: success, scraper: self.class.name).save!
  end
end
