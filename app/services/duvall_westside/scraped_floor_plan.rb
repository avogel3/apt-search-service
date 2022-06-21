class DuvallWestside::ScrapedFloorPlan
  attr_reader :floor_plan_document, :move_in_date

  def initialize(floor_plan_document, move_in_date)
    @floor_plan_document = floor_plan_document
    @move_in_date = move_in_date
  end

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

  def at(*args)
    floor_plan_document.at(*args)
  end

  def css(*args)
    floor_plan_document.css(*args)
  end

  def metadata
    css('ul > li').map(&:text).map(&:strip)
  end
end
