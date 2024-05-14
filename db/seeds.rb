default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("DB_POOL") { 5 } % >
  host: localhost
  port: 5432
  database: biblioteca
  username: openpg
  password: openpgpwd

development:
  <<: *default
  # Opcional: puedes añadir más configuraciones específicas para el entorno de desarrollo aquí.

test:
  <<: *default
  # Opcional: puedes añadir más configuraciones específicas para el entorno de prueba aquí.

production:
  <<: *default
  # Opcional: puedes añadir más configuraciones específicas para el entorno de producción aquí.
