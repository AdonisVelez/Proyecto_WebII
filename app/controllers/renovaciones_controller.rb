# app/controllers/renovaciones_controller.rb
class RenovacionesController < ApplicationController

  # Acción para renovar un préstamo
  def renovar
    prestamo = Prestamo.find_by(id: params[:prestamo_id])
    if prestamo && prestamo.renovar!
      render json: { message: "Préstamo renovado exitosamente" }, status: :ok
    else
      render json: { error: "Error al renovar el préstamo" }, status: :unprocessable_entity
    end
  end
end
