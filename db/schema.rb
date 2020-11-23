# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_051930) do

  create_table "books", force: :cascade do |t|
    t.string "titulo"
    t.string "autor"
    t.integer "anyo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "books_id", null: false
    t.integer "loans_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_details_on_books_id"
    t.index ["loans_id"], name: "index_details_on_loans_id"
  end

  create_table "fines", force: :cascade do |t|
    t.decimal "valor"
    t.date "fecha"
    t.boolean "estado"
    t.integer "Loan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Loan_id"], name: "index_fines_on_Loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.date "fecha"
    t.boolean "estado"
    t.integer "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_loans_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.string "direccion"
    t.string "telefono"
    t.string "password"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "details", "books", column: "books_id"
  add_foreign_key "details", "loans", column: "loans_id"
  add_foreign_key "fines", "Loans"
  add_foreign_key "loans", "users", column: "users_id"
end
