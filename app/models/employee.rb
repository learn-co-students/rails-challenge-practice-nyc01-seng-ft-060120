class Employee < ApplicationRecord
    belongs_to :company

    validates :name, :length => {maximum: 30, minimum:5}
end
