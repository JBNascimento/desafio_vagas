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

ActiveRecord::Schema.define(version: 2019_07_19_010903) do

  create_table "candidaturas", force: :cascade do |t|
    t.integer "pessoa_id"
    t.integer "vaga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_candidaturas_on_pessoa_id"
    t.index ["vaga_id"], name: "index_candidaturas_on_vaga_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "profissao"
    t.string "localizacao"
    t.integer "nivel"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vagas", force: :cascade do |t|
    t.string "empresa"
    t.string "titulo"
    t.string "descricao"
    t.string "localizacao"
    t.integer "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
