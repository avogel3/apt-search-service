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

  def save!; end
end
