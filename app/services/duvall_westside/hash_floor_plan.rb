class DuvallWestside::HashFloorPlan < ScrapedFloorPlan
  def name
    floor_plan_document.dig('name')
  end

  def price
    floor_plan_document.dig('lowPrice')&.to_i
  end

  def beds
    floor_plan_document.dig('beds')&.to_i
  end

  def baths
    floor_plan_document.dig('baths')&.to_i
  end

  def sq_ft
    only_digits(floor_plan_document.dig('sqft'))
  end

  def community
    'Duvall Westside'
  end

  alias available_at move_in_date

  def listing_link
    floor_plan_document.dig('availableUnitsURL')&.gsub("location.href='", '')&.gsub("';", '')
  end
end
