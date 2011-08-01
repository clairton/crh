class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :phone_number, :limit => 10
      t.string :adress_number, :limit => 10
      t.string :name, :limit => 200, :null => false
      t.string :remark
      t.boolean :active,:null => false, :default => true
      t.integer :place_type_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
