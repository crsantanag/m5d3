# == Schema Information
#
# Table name: series
#
#  id         :bigint           not null, primary key
#  name       :string
#  synopsis   :string
#  director   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SerieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
