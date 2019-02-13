# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_12_014036) do

  create_table "admins", force: :cascade do |t|
    t.string "codigo"
    t.string "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alquilers", force: :cascade do |t|
    t.integer "codigopersona"
    t.integer "codigoestacionamiento"
    t.datetime "inicioalquiler"
    t.datetime "finalquiler"
    t.decimal "precioporhora"
    t.decimal "preciototal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estacionamientoimagens", force: :cascade do |t|
    t.string "foto"
    t.integer "estacionamiento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estacionamiento_id"], name: "index_estacionamientoimagens_on_estacionamiento_id"
  end

  create_table "estacionamientos", force: :cascade do |t|
    t.integer "codigopersona"
    t.string "nombredescriptivo"
    t.string "direccion"
    t.string "direcciongooglemaps"
    t.string "numerotelefono"
    t.decimal "precioporhora"
    t.decimal "largo"
    t.decimal "ancho"
    t.decimal "altura"
    t.string "tipo"
    t.string "ubicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "distrito"
  end

  create_table "personas", force: :cascade do |t|
    t.integer "codigopersona"
    t.string "nombre"
    t.string "apepaterno"
    t.string "apematerno"
    t.boolean "sexo"
    t.string "tipodocumento"
    t.integer "numerodocumento"
    t.boolean "tipousuario"
    t.string "correo"
    t.string "contraseña"
    t.date "fechanacimiento"
    t.integer "numerocel"
    t.string "distrito"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicidads", force: :cascade do |t|
    t.integer "nombredescriptivo"
    t.string "nombrecliente"
    t.string "imagen"
    t.decimal "tarifa"
    t.integer "ubicacion"
    t.integer "frecuencia"
    t.integer "fecha"
    t.string "enlace"
    t.integer "estado"
    t.text "detalles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "serviciosadicionales", force: :cascade do |t|
    t.integer "codigopersona"
    t.string "tiposervicio"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
