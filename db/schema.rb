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

ActiveRecord::Schema.define(:version => 20110823161326) do

  create_table "address_places", :force => true do |t|
    t.string   "phone_number",     :limit => 15
    t.string   "code",             :limit => 15
    t.string   "name",             :limit => 200
    t.string   "remark"
    t.boolean  "active",                          :default => true, :null => false
    t.string   "type",                                              :null => false
    t.integer  "address_place_id"
    t.string   "acronym",          :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_domains", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_users", :force => true do |t|
    t.string   "name",            :limit => 200,                   :null => false
    t.integer  "email_domain_id",                                  :null => false
    t.text     "remark"
    t.boolean  "active",                         :default => true, :null => false
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financier_notes", :force => true do |t|
    t.decimal  "original_value",                :precision => 10, :scale => 0, :null => false
    t.date     "expiration_date",                                              :null => false
    t.date     "creation_date",                                                :null => false
    t.string   "name",            :limit => 20,                                :null => false
    t.integer  "number",                                                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_additional_types", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_additional_values", :force => true do |t|
    t.decimal  "value",                    :precision => 10, :scale => 0,                   :null => false
    t.integer  "goods_additional_type_id",                                                  :null => false
    t.boolean  "active",                                                  :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_items", :force => true do |t|
    t.string   "code",       :limit => 20,                    :null => false
    t.string   "name",       :limit => 200,                   :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_contact_addresses", :force => true do |t|
    t.integer  "participant_person_id",                         :null => false
    t.integer  "address_place_id",                              :null => false
    t.integer  "participant_contact_type_id",                   :null => false
    t.boolean  "active",                      :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_contact_emails", :force => true do |t|
    t.integer  "participant_person_id",                         :null => false
    t.integer  "email_user_id",                                 :null => false
    t.integer  "participant_contact_type_id",                   :null => false
    t.boolean  "active",                      :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_contact_types", :force => true do |t|
    t.string   "name",       :limit => 200,                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_people", :force => true do |t|
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

  create_table "participant_types", :force => true do |t|
    t.integer  "participant_person_id",                   :null => false
    t.string   "type",                                    :null => false
    t.boolean  "active",                :default => true, :null => false
    t.text     "remark"
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
    t.string   "code",          :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxe_values", :force => true do |t|
    t.integer  "taxe_type_id",                                                 :null => false
    t.decimal  "percentage",   :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "basis",        :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "value",        :precision => 10, :scale => 2,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_financiers", :force => true do |t|
    t.integer  "financier_note_id",                       :null => false
    t.integer  "transaction_record_id",                   :null => false
    t.boolean  "active",                :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_goods_additionals", :force => true do |t|
    t.integer  "transaction_goods_item_id",                   :null => false
    t.integer  "goods_additional_value_id",                   :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_goods_items", :force => true do |t|
    t.integer  "goods_item_id"
    t.integer  "transaction_record_id"
    t.string   "name",                  :limit => 200,                                                  :null => false
    t.string   "measure",               :limit => 6,                                                    :null => false
    t.decimal  "quantity",                             :precision => 10, :scale => 0,                   :null => false
    t.decimal  "unit_price",                           :precision => 10, :scale => 4,                   :null => false
    t.decimal  "full_price",                           :precision => 10, :scale => 2,                   :null => false
    t.boolean  "active",                                                              :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_goods_taxes", :force => true do |t|
    t.integer  "taxe_value_id",                               :null => false
    t.integer  "transaction_goods_item_id",                   :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_participants", :force => true do |t|
    t.integer  "participant_type_id",                     :null => false
    t.integer  "transaction_record_id",                   :null => false
    t.boolean  "active",                :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_records", :force => true do |t|
    t.date     "creation_date",                                                  :null => false
    t.integer  "code",                                                           :null => false
    t.string   "name",                                                           :null => false
    t.decimal  "tot",           :precision => 10, :scale => 4,                   :null => false
    t.decimal  "goods",         :precision => 10, :scale => 4,                   :null => false
    t.text     "remark"
    t.boolean  "active",                                       :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_taxes", :force => true do |t|
    t.integer  "transaction_record_id",                   :null => false
    t.integer  "taxe_value_id",                           :null => false
    t.boolean  "active",                :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_tots", :force => true do |t|
    t.integer  "transaction_record_id",                       :null => false
    t.integer  "goods_additional_value_id",                   :null => false
    t.text     "remark"
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transaction_xmls", :force => true do |t|
    t.integer  "transaction_record_id",                                  :null => false
    t.text     "content",                                                :null => false
    t.string   "name",                  :limit => 200,                   :null => false
    t.string   "xml_file_name",                                          :null => false
    t.string   "xml_content_type",                                       :null => false
    t.integer  "xml_file_size",                                          :null => false
    t.datetime "xml_updated_at",                                         :null => false
    t.boolean  "active",                               :default => true, :null => false
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
