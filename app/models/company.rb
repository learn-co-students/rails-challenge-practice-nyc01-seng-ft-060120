class Company < ApplicationRecord
    has_many :offices 
    has_many :employees
    has_many :buildings, through: :offices


    accepts_nested_attributes_for :offices

    def offices_attributes=(attributes)    
        attributes.values.each do |attr| 

            # building = Building.find_or_create_by(id: attr[:building_id].to_i)
            building_id = attr[:id].to_i
            offices = attr[:offices]      
            offices = offices.select {|o| o != ""} 
            offices.each do |floor|   
             self.offices << Office.create!(:building_id => building_id, :company_id=>self.id,      
                :floor => floor)
            end    
        end  
    end
end
 