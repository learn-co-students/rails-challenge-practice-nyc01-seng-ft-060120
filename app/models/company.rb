class Company < ApplicationRecord
  has_many :employees
  has_many :offices
  has_many :buildings, :through => :offices

  accepts_nested_attributes_for :offices

  #Overwrite
  def offices_attributes=(attributes)
    attributes.values.each do |attr|
      building_id = attr[:id].to_i
      offices = attr[:offices] # grab array of floors from params
      offices = offices.select{|o| o != ""} # remove all empty floors

      # create an office at each floor
      offices.each do |floor|
        self.offices << Office.create!(:building_id => building_id, :company_id => self.id,
        :floor => floor.to_i)
      end
    end
  end

end
