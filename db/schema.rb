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

ActiveRecord::Schema.define(version: 20160101181042) do

  create_table "cuva_zapis", force: :cascade do |t|
    t.integer  "id_lista",   limit: 4
    t.integer  "mjesto",     limit: 4
    t.integer  "id_zapis",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "cuva_zapis", ["id_lista"], name: "index_cuva_zapis_on_id_lista", using: :btree

  create_table "lista_zeljas", force: :cascade do |t|
    t.integer  "id_korisnik", limit: 4
    t.boolean  "potvrden"
    t.datetime "potvrden_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer  "id_korisnik",     limit: 4
    t.datetime "datum_unosa"
    t.datetime "datum_izvrsenja"
    t.integer  "izvrsen",         limit: 4, default: 0
    t.boolean  "potvrden"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "sadrzi_zapis", force: :cascade do |t|
    t.integer  "id_playlist", limit: 4
    t.integer  "mjesto",      limit: 4
    t.integer  "id_zapis",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sadrzi_zapis", ["id_playlist"], name: "index_sadrzi_zapis_on_id_playlist", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "author",         limit: 255
    t.string   "company",        limit: 255
    t.string   "path",           limit: 255
    t.string   "format",         limit: 255
    t.string   "frekvencija",    limit: 255
    t.string   "bitovi_kvant",   limit: 255
    t.string   "zanr",           limit: 255
    t.string   "vrsta_nosaca",   limit: 255
    t.string   "godina_izdanja", limit: 255
    t.integer  "minute",         limit: 4,   default: 0
    t.integer  "sekunde",        limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "ime",               limit: 255
    t.string   "prezime",           limit: 255
    t.string   "email",             limit: 255
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.integer  "uloga",             limit: 4,   default: 3
    t.string   "string",            limit: 255
    t.boolean  "activated"
    t.string   "activation_digest", limit: 255
    t.datetime "activated_at"
    t.datetime "termin_urednika",               default: '2016-01-01 00:00:00'
    t.datetime "activity"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
