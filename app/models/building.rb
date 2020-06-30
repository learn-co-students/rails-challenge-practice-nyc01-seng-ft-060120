class Building < ApplicationRecord
  has_many :offices
  has_many :companies, :through => :offices

  def number_of_floors_available
    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_earnings
    self.number_of_floors * self.rent_per_floor
  end

  def get_employees_count
    all_employees = self.companies.map(&:employees)
    all_employees.sum.count
  end

end
