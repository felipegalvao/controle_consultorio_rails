# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150622140732) do

  create_table "pacientes", force: true do |t|
    t.string   "nome"
    t.string   "identidade"
    t.string   "cpf"
    t.date     "data_de_nascimento"
    t.string   "plano_de_saude"
    t.string   "sexo"
    t.string   "endereco"
    t.string   "telefone_fixo"
    t.string   "telefone_celular"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numero_plano_de_saude"
  end

  add_index "pacientes", ["cpf"], name: "index_pacientes_on_cpf", using: :btree
  add_index "pacientes", ["email"], name: "index_pacientes_on_email", using: :btree
  add_index "pacientes", ["identidade"], name: "index_pacientes_on_identidade", using: :btree
  add_index "pacientes", ["nome"], name: "index_pacientes_on_nome", using: :btree
  add_index "pacientes", ["plano_de_saude"], name: "index_pacientes_on_plano_de_saude", using: :btree
  add_index "pacientes", ["user_id"], name: "index_pacientes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
