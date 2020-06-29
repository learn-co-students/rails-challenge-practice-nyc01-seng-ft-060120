class CompaniesController < ApplicationController
before_action :set_company, only: [:edit, :show, :update]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to @company
    else
      flash.now[:errors] = @company.errors.full_messages
      render :new
    end
  end

  def edit 
  end

  def show
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      render :new
    end
  end


  private
  def company_params
    params.require(:company).permit(:name)
  end


  def set_company
    @company = Company.find(params[:id])
  end
end