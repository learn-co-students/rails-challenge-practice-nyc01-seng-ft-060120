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
require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
