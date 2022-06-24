class FloorPlansController < ApplicationController
  expose(:floor_plan, scope: -> { FloorPlan.includes(:price_histories) })
end
