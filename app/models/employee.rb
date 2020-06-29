# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  title      :string           not null
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  validates_presence_of :name, :title, null: false
  validates_length_of :name, :minimum => 5
  belongs_to :company
  accepts_nested_attributes_for :company
end
