# app/controllers/usuarios_controller.rb
class UsuariosController < ApplicationController
  # Acción para registrar un nuevo usuario
  def registrar
    usuario = Usuario.new(usuario_params)
    if usuario.save
      render json: { message: "Usuario registrado exitosamente" }, status: :created
    else
      render json: { error: "Error al registrar el usuario", details: usuario.errors }, status: :unprocessable_entity
    end
  end

  # Acción para iniciar sesión
  def iniciar_sesion
    usuario = Usuario.find_by(correo: params[:correo])
    if usuario && usuario.authenticate(params[:password])
      # Si el usuario existe y la contraseña es correcta, puedes devolver algún tipo de token de autenticación
      render json: { message: "Inicio de sesión exitoso", token: generate_token(usuario) }, status: :ok
    else
      render json: { error: "Correo electrónico o contraseña incorrectos" }, status: :unauthorized
    end
  end

  private
  # Método privado para definir los parámetros permitidos para crear un nuevo usuario
  def usuario_params
    params.require(:usuario).permit(:nombre, :direccion, :telefono, :correo, :password)
  end

  # Generar un token de autenticación (ejemplo)
  def generate_token(usuario)
    # Lógica para generar un token único para el usuario
  end
end
