# == Schema Information
#
# Table name: documentaries
#
#  id         :bigint           not null, primary key
#  name       :string
#  synopsis   :string
#  director   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Documentary < ApplicationRecord
  validates :name,
    presence: { message: "no puede estar vacío" },
    length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }

  validates :director,
    presence: { message: "no puede estar vacío" },
    length: { in: 2..50, message: "debe tener entre 2 y 50 caracteres" }

  validates :synopsis,
    presence: { message: "no puede estar vacío" },
    length: { in: 2..250, message: "debe tener entre 2 y 250 caracteres" }
end
