class CreateParticipantTypes < ActiveRecord::Migration
  def self.up
    create_table :participant_types do |t| 
      t.integer :participant_person_id, :null => false
      t.string :type, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :participant_types
  end
end
