class Company < ApplicationRecord
    has_many :offices
    has_many :buildings, through: :offices
    has_many :employees

    accepts_nested_attributes_for :offices

    def offices_attributes=(attributes)
        attributes.values.each do |attr|
            building_id = attr[:id].to_i
 
            offices = attr[:offices]
            offices = offices.select{|o| o != ""}
            offices.each do |floor|
                self.offices << Office.create!(:building_id => building_id, :company_id => self.id, :floor => floor.to_i)
            end
        end
    end
end
