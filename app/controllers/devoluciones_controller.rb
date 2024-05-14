# app/controllers/devoluciones_controller.rb
class DevolucionesController < ApplicationController
  # Acción para registrar la devolución de un préstamo
  def crear
    prestamo = Prestamo.find_by(id: params[:prestamo_id])
    if prestamo
      prestamo.fecha_devolucion = Date.today
      if prestamo.save
        prestamo.libro.increment!(:num_ejemplares)
        render json: { message: "Devolución registrada exitosamente" }, status: :ok
      else
        render json: { error: "Error al registrar la devolución", details: prestamo.errors }, status: :unprocessable_entity
      end
    else
      render json: { error: "No se puede encontrar el préstamo con el ID proporcionado" }, status: :not_found
    end
  end
end
