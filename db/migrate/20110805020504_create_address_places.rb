class CreateAddressPlaces < ActiveRecord::Migration
  def self.up
    create_table :address_places do |t|
      t.string :phone_number, :limit => 15
      t.string :code, :limit => 15
      t.string :name, :limit => 200
      t.string :remark
      t.boolean :active, :null => false, :default => true
      t.string :type, :null => false
      t.integer :address_place_id
      t.string :acronym, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :address_places
  end
end

