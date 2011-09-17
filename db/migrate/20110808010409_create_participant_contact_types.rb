class CreateParticipantContactTypes < ActiveRecord::Migration
  def self.up
    create_table :participant_contact_types do |t|
      t.string :name, :null => false, :limit => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :participant_contact_types
  end
end

