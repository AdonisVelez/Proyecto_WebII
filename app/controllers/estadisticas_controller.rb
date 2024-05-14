# app/controllers/estadisticas_controller.rb
class EstadisticasController < ApplicationController

   # Acción para mostrar los libros más populares
  def libros_populares
    libros_populares = Libro.most_popular(limit: 10)
    render json: libros_populares, status: :ok
  end

   # Acción para mostrar la cantidad de préstamos por usuario
  def prestamos_por_usuario
    prestamos_por_usuario = Usuario.joins(:prestamos).group(:id).count
    render json: prestamos_por_usuario, status: :ok
  end
end
