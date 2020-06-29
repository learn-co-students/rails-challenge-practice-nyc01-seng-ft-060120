class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update]

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def show
  end

  def edit
  end

  def update
    if @building.update(building_params)
      redirect_to @building
    else 
      render :new
    end
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to @building
    else 
      flash.now[:errors] = @building.errors.full_messages 
      render :new 
    end
  end

  private

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
  end

  def set_building 
    @building = Building.find(params[:id])
  end
end