class ApartmentsController < ApplicationController
  expose(:floor_plans) { FloorPlan.all }

  def index; end
end
