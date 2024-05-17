class Editorial < ApplicationRecord
  # Relaciones
  has_many :libros

  # Validaciones
  validates :nombre, presence: true
end
