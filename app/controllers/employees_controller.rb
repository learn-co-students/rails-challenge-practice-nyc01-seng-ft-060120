class EmployeesController < ApplicationController

  def index
    # Search logic
    if params[:search]
      @employees = Employee.search_by_name(params[:search])
    else
      @employees = Employee.all
    end
  end

  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to employee_path(@employee)
    else
      puts @employee.errors.messages
      redirect_to employees_path
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :title, :company_id, :search)
  end


end
