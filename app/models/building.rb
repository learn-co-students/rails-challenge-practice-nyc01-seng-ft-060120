# == Schema Information
#
# Table name: buildings
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  country          :string           not null
#  address          :string           not null
#  rent_per_floor   :integer          not null
#  number_of_floors :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Building < ApplicationRecord
  validates_presence_of :rent_per_floor, :number_of_floors, numericality: { only_integer: true}
  validates_presence_of :address, :name, uniqueness:true
  validates_presence_of :country
  has_many :offices
  has_many :companies, through: :offices

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def unique_companies
    companies.select(:name, :id).distinct
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def offices_by_company(company_id)
    offices.select { |o| o.company_id == company_id }
  end

end
