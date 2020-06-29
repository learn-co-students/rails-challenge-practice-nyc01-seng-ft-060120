class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company

    validates :floor, :numericality => true
end
