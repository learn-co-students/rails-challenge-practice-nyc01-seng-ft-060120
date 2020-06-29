# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  validates_presence_of :name
  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices

  def building_name
    self.building.name
  end

  def office_name
    self.office.name
  end

  def employee_name
    self.employee.name
  end

 
  def company_buildings
    buildings.select { |b| b.id}.uniq
  end

  def total_rent
    sum = 0
    self.company_buildings.each do |b|
     rent = b.rent_per_floor * offices_per_building(b.id)
      sum += rent
    end
    sum
  end 

  def offices_per_building(building_id)
    num = self.offices.filter{ |o| o.building_id == building_id}.count
  end

  def office_employees
    self.employees.where(company_id: self.building_id)
  end


end
