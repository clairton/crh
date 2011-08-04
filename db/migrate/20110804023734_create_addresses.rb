class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :person_id, :null => false
      t.integer :place_id, :null => false
      t.integer :contact_type_id, :null => false
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end

