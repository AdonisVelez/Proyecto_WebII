class Editorial < ApplicationRecord
  self.table_name = "editrorial"
  # Relaciones
  has_many :libros

  # Validaciones
  validates :nombre, presence: true
end
