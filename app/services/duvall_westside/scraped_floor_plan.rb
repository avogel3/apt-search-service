class DuvallWestside::ScrapedFloorPlan < ScrapedFloorPlan
  def name
    at('.card-title').text.strip
  end

  def price
    only_digits(at('.font-weight-bold.mb-1.text-md').text.strip.split(' ').find { |text| text.include?('$') })
  end

  def beds
    only_digits(metadata.find { |d| d.include?('Bed') })
  end

  def baths
    only_digits(metadata.find { |d| d.include?('Bath') })
  end

  def sq_ft
    only_digits(metadata.find { |d| d.include?('Sq.Ft.') })
  end

  def community
    'Duvall Westside'
  end

  alias available_at move_in_date

  def listing_link
    path = at('a[name=applynow]')&.attributes&.dig('href')&.value
    return unless path.present?

    ['https://www.duvallwestside.com', path].join
  end

  private

  def metadata
    css('ul > li').map(&:text).map(&:strip)
  end
end
