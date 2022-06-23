class ScrapedFloorPlan
  attr_reader :floor_plan_document, :move_in_date

  def initialize(floor_plan_document, move_in_date)
    @floor_plan_document = floor_plan_document
    @move_in_date = move_in_date
  end

  delegate(:at, :css, to: :floor_plan_document)

  def price
    raise NotImplementedError
  end

  def name
    raise NotImplementedError
  end

  def beds
    raise NotImplementedError
  end

  def baths
    raise NotImplementedError
  end

  def available_at
    raise NotImplementedError
  end

  def community
    raise NotImplementedError
  end

  def sq_ft
    raise NotImplementedError
  end

  def listing_link; end

  def to_h
    {
      name: name,
      beds: beds,
      baths: baths,
      available_at: available_at,
      community: community,
      sq_ft: sq_ft,
      listing_link: listing_link,
      updated_at: Time.now.utc
    }
  end

  protected

  def only_digits(string_val)
    (string_val || '').gsub(/\D+/, '')
  end
end
