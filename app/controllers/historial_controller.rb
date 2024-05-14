# app/controllers/historial_controller.rb
class HistorialController < ApplicationController

  # Acción para mostrar el historial de préstamos de un usuario
  def index
    historial = current_user.prestamos_historial
    render json: historial, status: :ok
  end
end
