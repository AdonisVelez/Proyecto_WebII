# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  # Método para iniciar sesión del usuario
  def sign_in(usuario)
    session[:usuario_id] = usuario.id
  end

  # Método para cerrar sesión del usuario
  def sign_out
    session.delete(:usuario_id)
  end
end
