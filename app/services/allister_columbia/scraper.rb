class AllisterColumbia::Scraper
  attr_reader :move_in_date

  def initialize(move_in_date)
    @move_in_date = Date.strptime(move_in_date, '%m/%d/%Y')
  end

  def call
    res = Net::HTTP.get_response(scrape_url)
    return [] unless res.is_a?(Net::HTTPSuccess)

    page = Nokogiri::HTML(res.body)

    page.css('li.fp-group-item').map do |fp|
      AllisterColumbia::FloorPlan.new(fp, move_in_date)
    end
  end

  private

  def scrape_url
    base_url = 'https://www.alistercolumbia.com/Apartments/module/property_info/action/view_floorplans/property%5Bid%5D/550503//'

    query = URI.encode_www_form([
                                  ['fp_filter_request'],
                                  ['number_of_bedrooms_operator', '>='],
                                  ['number_of_bathrooms_operator', '>='],
                                  ['current_floorplan_tab'],
                                  %w[occupancy_type conventional],
                                  ['masked-move_in_date', move_in_date.strftime('%m/%d/%Y')],
                                  ['move_in_date', move_in_date.strftime('%Y-%m-%d')],
                                  ['floorplan_availability_filter[number_of_bedrooms]', ''],
                                  ['floorplan_availability_filter[number_of_bathrooms]', ''],
                                  %w[military_status_type inactive]
                                ])
    URI.parse([base_url, query].join('?'))
  end
end
