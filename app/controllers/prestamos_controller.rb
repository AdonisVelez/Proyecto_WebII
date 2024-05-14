# app/controllers/prestamos_controller.rb
class PrestamosController < ApplicationController

  # Acción para crear un nuevo préstamo
  def crear
    prestamo = Prestamo.new(prestamo_params)
    if prestamo.save
      render json: { message: "Préstamo registrado exitosamente" }, status: :created
    else
      render json: { error: "Error al registrar el préstamo", details: prestamo.errors }, status: :unprocessable_entity
    end
  end

  private
  # Método privado para definir los parámetros permitidos para crear un préstamo
  def prestamo_params
    params.require(:prestamo).permit(:libro_id, :usuario_id, :fecha_prestamo, :fecha_vencimiento)
  end
end

  # Acción para mostrar todos los préstamos activos
  def index
    prestamos_activos = Prestamo.where("fecha_vencimiento >= ? AND fecha_devolucion IS NULL", Date.today)
    render json: prestamos_activos, only: [:id, :fecha_prestamo, :fecha_vencimiento], include: { libro: { only: [:id, :titulo] }, usuario: { only: [:id, :nombre] } }, status: :ok
  end
end
