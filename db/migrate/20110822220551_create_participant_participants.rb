class CreateParticipantParticipants < ActiveRecord::Migration
  def self.up
    create_table :participant_participants do |t|
      t.string :type, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :participant_participants
  end
end
