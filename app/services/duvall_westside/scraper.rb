class DuvallWestside::Scraper < Scraper
  def scrape!
    page = mechanize.get('https://www.duvallwestside.com/floorplans')

    filter_form = page.forms.find { |form| form.action == '/availableunits' }
    filter_form['move-in-date'] = move_in_date
    filter_form.submit

    page.css('.fp-container').map do |fp|
      DuvallWestside::ScrapedFloorPlan.new(fp, move_in_date)
    end
  end

  private

  def mechanize
    @mechanize ||= Mechanize.new
  end
end
