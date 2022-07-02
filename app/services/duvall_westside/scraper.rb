class DuvallWestside::Scraper < Scraper
  def scrape!
    results.map do |fp|
      DuvallWestside::FloorPlan.new(fp, move_in_date).data
    end
  end

  def scrape_old!
    filter_form = page.forms.find { |form| form.action == '/availableunits' }
    return [] unless filter_form.present?

    filter_form['move-in-date'] = move_in_date
    filter_form.submit

    page.css('.fp-container')
  end

  def scrape_new!
    raw_data = page.css('script').select do |s|
                 s.attributes.length.zero?
               end.find { |s| s.text.include?('var pageData = {') }

    return [] unless raw_data.present?

    page_data = JavascriptObjectParser.new(raw_data.text).to_h
    page_data.fetch('floorplans', [])
  end

  private

  def results
    res = scrape_old!
    return res if res.any?

    scrape_new!
  end

  def page
    @page ||= mechanize.get('https://www.duvallwestside.com/floorplans')
  end

  def mechanize
    @mechanize ||= Mechanize.new
  end
end
