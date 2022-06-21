class AllisterColumbia::ScrapedFloorPlan < ScrapedFloorPlan
  def name
    at('.fp-name-link').text.strip
  end

  def price
    at('.rent').text.strip.split(' ').find { |text| text.include?('$') }
  end

  def beds
    at('[itemprop="numberOfBedrooms"]').attributes['content'].value
  end

  def baths
    at('[itemprop="numberOfBathroomsTotal"]').attributes['content'].value
  end

  def sq_ft
    el_text = at('.sq-feet').text.strip
    matches = el_text.match(/\d+/)[0]
    return matches[0] if !!matches

    el_text
  end

  def available_at
    available_text = at('[data-class=check-availability]').text.strip
    return Date.today if available_text == 'Only One Left!'

    available_text
  end

  def community
    'Allister Columbia'
  end
end
