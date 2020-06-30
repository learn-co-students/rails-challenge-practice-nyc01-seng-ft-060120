class BuildingsController < ApplicationController

  before_action :set_building, :only => [:edit, :update, :show]

  def index
    @buildings = Building.all
  end

  def edit
  end

  def update
    @building.update(building_params(:name, :rent_per_floor))
    redirect_to building_path(@building)
  end

  def show
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params(*args)
    params.require(:building).permit(args)
  end

end
