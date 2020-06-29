# == Schema Information
#
# Table name: offices
#
#  id          :integer          not null, primary key
#  building_id :integer          not null
#  company_id  :integer          not null
#  floor       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Office < ApplicationRecord
  belongs_to :building
  belongs_to :company
  validates_presence_of :floor, numericality: { only_integer: true }

  def building_name
    self.building.name
  end

  def unique_buildings
    companies.select(:name, :id).distinct
  end

  def company_name 
    self.company.name
  end

  def rent_per_floor
    builing.rent_per_floor
  end

  def company_employees
    self.company.employees
  end
  

end
