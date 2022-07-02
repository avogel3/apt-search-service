class DuvallWestside::FloorPlan
  attr_reader :floor_plan, :move_in_date

  def initialize(floor_plan, move_in_date)
    @floor_plan = floor_plan
    @move_in_date = move_in_date
  end

  def data
    DuvallWestside::HashFloorPlan.new(floor_plan, move_in_date) if floor_plan.is_a?(Hash)

    DuvallWestside::ScrapedFloorPlan.new(floor_plan, move_in_date)
  end
end
