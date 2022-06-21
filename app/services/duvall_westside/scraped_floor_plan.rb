class DuvallWestside::ScrapedFloorPlan < ScrapedFloorPlan
  def name
    at('.card-title').text.strip
  end

  def price
    at('.font-weight-bold.mb-1.text-md').text.strip.split(' ').find { |text| text.include?('$') }
  end

  def beds
    metadata.find { |d| d.include?('Bed') }
  end

  def baths
    metadata.find { |d| d.include?('Bath') }
  end

  def sq_ft
    metadata.find { |d| d.include?('Sq.Ft.') }
  end

  alias available_at move_in_date

  private

  def metadata
    css('ul > li').map(&:text).map(&:strip)
  end
end
