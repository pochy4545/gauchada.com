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

ActiveRecord::Schema.define(version: 20170624213333) do

  create_table "buys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cantidad"
    t.float    "precio_total",      limit: 24
    t.float    "precio_actual",     limit: 24
    t.date     "fecha"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.integer  "numero_de_tarjeta"
    t.index ["user_id"], name: "index_buys_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "numero"
    t.float    "credito",    limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categoria", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "gauchada_id", default: 1
    t.index ["gauchada_id"], name: "index_categoria_on_gauchada_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "provincia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "fecha"
    t.text     "texto",      limit: 65535
    t.date     "hora"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "compras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cantidad"
    t.float    "precio",        limit: 24
    t.date     "fecha"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "precio_actual", limit: 24
    t.integer  "user_id"
    t.index ["user_id"], name: "index_compras_on_user_id", using: :btree
  end

  create_table "creditos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "total_de_creditos"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "gauchadas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "title"
    t.text     "descripcion",        limit: 65535
    t.string   "estado"
    t.date     "fecha_de_inicio"
    t.date     "fecha_limite"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "ciudad"
    t.integer  "cant_postulantes",                 default: 0
    t.index ["user_id"], name: "index_gauchadas_on_user_id", using: :btree
  end

  create_table "postularses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "aprobado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "gauchada_id"
    t.string   "descripcion"
    t.index ["gauchada_id"], name: "index_postularses_on_gauchada_id", using: :btree
    t.index ["user_id"], name: "index_postularses_on_user_id", using: :btree
  end

  create_table "reputacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.integer  "inicio"
    t.integer  "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarjeta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "numero"
    t.float    "credito",    limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.datetime "fecha_de_nacimiento"
    t.boolean  "es_admin",               default: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "creditos",               default: 1
    t.integer  "clalificacion",          default: 1
    t.integer  "reputacion_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reputacion_id"], name: "index_users_on_reputacion_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "buys", "users"
  add_foreign_key "compras", "users"
  add_foreign_key "gauchadas", "users"
  add_foreign_key "postularses", "gauchadas"
  add_foreign_key "postularses", "users"
  add_foreign_key "users", "reputacions"
end
