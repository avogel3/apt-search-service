class DuvallWestside::Scraper < Scraper
  def scrape!
    resp_body = Net::HTTP.get(URI('https://www.duvallwestside.com/floorplans'))
    page = Nokogiri::HTML(resp_body)

    raw_data = page.css('script').select do |s|
                 s.attributes.length.zero?
               end.find { |s| s.text.include?('var pageData = {') }

    return [] unless raw_data.present?

    page_data = JavascriptObjectParser.new(raw_data.text).to_h
    page_data.fetch('floorplans', []).map do |fp|
      DuvallWestside::ScrapedFloorPlan.new(fp, move_in_date)
    end
  end

  private

  def mechanize
    @mechanize ||= Mechanize.new
  end
end
