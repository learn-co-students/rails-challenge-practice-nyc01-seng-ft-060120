class Employee < ApplicationRecord
  belongs_to :company

  validates :name, :length => {:minimum => 5, :maximum => 30}
end
