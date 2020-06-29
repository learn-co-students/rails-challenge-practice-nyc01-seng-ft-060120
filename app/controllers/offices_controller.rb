class OfficesController < ApplicationController

  before_action :set_office, only: [:show, :edit, :update, :destroy]
  
  def index
    @offices = Office.all
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def office_params
    params.require(:office).permit(:company_id, :building_id)
  end

  def set_office
    @office = Office.find(params[:id])
  end
end