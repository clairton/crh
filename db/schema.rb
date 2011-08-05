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

ActiveRecord::Schema.define(:version => 20110805024527) do

  create_table "address_places", :force => true do |t|
    t.string   "phone_number",     :limit => 15
    t.string   "adress_number",    :limit => 15
    t.string   "name",             :limit => 200
    t.string   "remark"
    t.boolean  "active",                          :default => true, :null => false
    t.string   "type"
    t.integer  "address_place_id"
    t.string   "acronym",          :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "person_id",                         :null => false
    t.integer  "place_id",                          :null => false
    t.integer  "contact_type_id",                   :null => false
    t.boolean  "active",          :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "domain",          :limit => 200,                   :null => false
    t.string   "name",            :limit => 200,                   :null => false
    t.text     "remark"
    t.integer  "contact_type_id",                                  :null => false
    t.integer  "person_id",                                        :null => false
    t.boolean  "active",                         :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financier_notes", :force => true do |t|
    t.decimal  "original_value",  :precision => 10, :scale => 0
    t.date     "expiration_date"
    t.date     "creation_date"
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name", :limit => 200,                   :null => false
    t.string   "last_name",  :limit => 200
    t.string   "nickname",   :limit => 200
    t.date     "birthday"
    t.string   "code",       :limit => 20,                    :null => false
    t.string   "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.integer  "number",          :null => false
    t.text     "remark"
    t.integer  "person_id",       :null => false
    t.integer  "extension"
    t.integer  "place_id",        :null => false
    t.integer  "contact_type_id", :null => false
    t.boolean  "active",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxe_groups", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxe_types", :force => true do |t|
    t.string   "name",          :limit => 200,                    :null => false
    t.text     "remark"
    t.boolean  "active",                       :default => false, :null => false
    t.integer  "taxe_group_id",                                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxe_values", :force => true do |t|
    t.integer  "taxe_type_id"
    t.decimal  "percentage",   :precision => 10, :scale => 0
    t.decimal  "basis",        :precision => 10, :scale => 0
    t.decimal  "value",        :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxes", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
