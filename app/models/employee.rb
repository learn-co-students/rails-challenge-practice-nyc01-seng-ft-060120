class Employee < ApplicationRecord
  belongs_to :company

  validates :name, :length => {:minimum => 5, :maximum => 30}

  def self.search_by_name(name)
    employees = [Employee.find_by(:name => name)]
    if employees.first == nil
      employees = Employee.all
    end
    employees
  end

end
