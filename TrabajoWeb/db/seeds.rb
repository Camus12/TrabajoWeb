#
#
#   Character.create(name: 'Luke', movie: movies.first)
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Examples:
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
Estacionamiento.create(nombredescriptivo: "Estacionamiento Don Pedrito", direccion: "Av. La Marina 248", distrito: "San Miguel", precioporhora: 2.50, largo: 10, ancho: 10, altura: 3, tipo: "INTER", ubicacion: "PISO1")
Estacionamiento.create(nombredescriptivo: "Los Portalitos", direccion: "Av. José Pardo 875", distrito: "Miraflores", precioporhora: 3.50, largo: 10, ancho: 10, altura: 3, tipo: "EXTER", ubicacion: "AZOT")
Estacionamiento.create(nombredescriptivo: "Estac. Los Suspiros", direccion: "Av. Morro Solar 1145", distrito: "Barranco", precioporhora: 4.50, largo: 10, ancho: 10, altura: 3, tipo: "AIRE", ubicacion: "SOTAN")
Estacionamiento.create(nombredescriptivo: "Particular", direccion: "Av. Lima 293", distrito: "Breña", precioporhora: 5.00, largo: 10, ancho: 10, altura: 3, tipo: "INTER", ubicacion: "PISO1")
