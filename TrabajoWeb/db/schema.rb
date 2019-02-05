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

ActiveRecord::Schema.define(version: 2019_02_04_185223) do

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

  create_table "serviciosadicionales", force: :cascade do |t|
    t.integer "codigopersona"
    t.string "tiposervicio"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
