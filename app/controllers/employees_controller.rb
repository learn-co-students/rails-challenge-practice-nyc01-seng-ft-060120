class EmployeesController < ApplicationController
  before_action :get_company, only: [:show, :edit, :update, :destroy]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  def new
    @employee = Employee.new
  end

  def create
    @company = Company.find(params[:company_id])
    @employee = Employee.create(employee_params)
    if @employee.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
  end

  def index
    @employees = Employee.all
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :new
    end
  end

  def destroy
    @company = @employee.company
    @employee.destroy
    redirect_to @company
  end


  private
  def employee_params
    params.require(:employee).permit(:name, :title, :company_id, company_attributes: [:name])
  end
  
 def get_company
   @company = Company.find(params[:company_id])
 end

  def set_employee
    @employee = @company.employees.find(params[:id])
  end

  
end