class AllisterColumbia::ScrapedFloorPlan < ScrapedFloorPlan
  def name
    at('.fp-name-link').text.strip
  end

  def price
    only_digits(at('.rent').text.strip.split(' ').find { |text| text.include?('$') })
  end

  def beds
    only_digits(at('[itemprop="numberOfBedrooms"]').attributes['content'].value)
  end

  def baths
    only_digits(at('[itemprop="numberOfBathroomsTotal"]').attributes['content'].value)
  end

  def sq_ft
    only_digits(at('.sq-feet > .fp-col-text').text.strip)
  end

  def available_at
    available_text = at('[data-class=check-availability]').text.strip
    return Date.today if available_text == 'Only One Left!'

    available_text
  end

  def community
    'Allister Columbia'
  end

  def listing_link
    at("a[title='View More Information']")&.attributes&.dig('href')&.value
  end
end
