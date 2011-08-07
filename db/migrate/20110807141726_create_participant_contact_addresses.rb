class CreateParticipantContactAddresses < ActiveRecord::Migration
  def self.up
    create_table :participant_contact_addresses do |t|
      t.integer :person_id, :null => false
      t.integer :place_id, :null => false
      t.integer :type_id, :null => false
      t.boolean :active, :default => true, :null => false
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :participant_contact_addresses
  end
end

