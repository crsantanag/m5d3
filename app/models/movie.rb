# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  name       :string
#  synopsis   :string
#  director   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  validates :name,     presence: true, length: {in:2..50}
  validates :director, presence: true, length: {in: 2..50}
  validates :synopsis, presence: true, length: {in:2..250}
end
