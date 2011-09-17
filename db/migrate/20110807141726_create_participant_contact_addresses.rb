class CreateParticipantContactAddresses < ActiveRecord::Migration
  def self.up
    create_table :participant_contact_addresses do |t|
      t.integer :participant_person_id, :null => false
      t.integer :address_place_id, :null => false
      t.integer :participant_contact_type_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :participant_contact_addresses
  end
end

