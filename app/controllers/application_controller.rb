# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Método para autenticar al usuario antes de cada acción del controlador
  before_action :authenticate_user!

  private

  # Método para verificar si el usuario está autenticado
  def authenticate_user!
    unless current_user
      render json: { error: "Acceso no autorizado. Debe iniciar sesión primero." }, status: :unauthorized
    end
  end

  # Método para verificar si el usuario tiene permisos para acceder a una acción específica
  def authorize_user!
    unless current_user.admin?
      render json: { error: "No tiene permisos suficientes para realizar esta acción." }, status: :forbidden
    end
  end

  # Método para obtener el usuario actualmente autenticado
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Método para verificar si el usuario actual es un administrador
  def require_admin
    unless current_user && current_user.admin?
      render json: { error: "Acceso no autorizado. Esta acción requiere privilegios de administrador." }, status: :forbidden
    end
  end

  # Método para iniciar sesión del usuario
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Método para cerrar sesión del usuario
  def sign_out
    session.delete(:user_id)
  end
end
