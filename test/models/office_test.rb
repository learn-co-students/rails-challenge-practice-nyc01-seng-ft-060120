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
require 'test_helper'

class OfficeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
