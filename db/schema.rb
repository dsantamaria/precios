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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130517023227) do

  create_table "categoria_productos", :force => true do |t|
    t.string   "nombre"
    t.boolean  "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.boolean  "estado",     :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "productos", :force => true do |t|
    t.string   "nombre"
    t.string   "ingrediente_activo"
    t.string   "concentracion_ing_activo"
    t.string   "tipo_formula"
    t.string   "cantidad_unitaria"
    t.string   "unidad"
    t.string   "empaque_unitario"
    t.string   "precio"
    t.string   "precio_unitario"
    t.string   "ultimo_update"
    t.boolean  "estado"
    t.integer  "proveedor_id"
    t.integer  "categoria_producto_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "productos", ["categoria_producto_id"], :name => "index_productos_on_categoria_producto_id"
  add_index "productos", ["proveedor_id"], :name => "index_productos_on_proveedor_id"

  create_table "proveedors", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.boolean  "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                    :null => false
    t.string   "encrypted_password",                       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "empresa_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "admin",                  :default => true
    t.boolean  "activo",                 :default => true
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["empresa_id"], :name => "index_usuarios_on_empresa_id"
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
