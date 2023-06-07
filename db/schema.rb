# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_06_215917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arriendos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "pelicula_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_arriendos_on_cliente_id"
    t.index ["pelicula_id"], name: "index_arriendos_on_pelicula_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peliculas", force: :cascade do |t|
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "arriendos", "clientes"
  add_foreign_key "arriendos", "peliculas"
end
