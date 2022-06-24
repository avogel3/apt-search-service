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
        upserted.zip(results).map do |upserted_record, fp|
          fp_id = upserted_record['id']
          next unless fp.price.present?

          # FIXME: this can cause an issue if a price changes but then returns to the same price later on
          # IE, we could lose out on the date(s) of that price
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
