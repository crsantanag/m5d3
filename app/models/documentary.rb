class Documentary < ApplicationRecord
  validates :name,     presence: true, length: {in:2..50}
  validates :director, presence: true, length: {in: 2..50}
  validates :synopsis, presence: true, length: {in:2..250}
end
