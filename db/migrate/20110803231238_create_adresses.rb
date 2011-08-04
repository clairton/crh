class CreateAdresses < ActiveRecord::Migration
  def self.up
    create_table :adresses do |t|
      t.integer :person_id, :null => false
      t.integer :place_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :adresses
  end
end
