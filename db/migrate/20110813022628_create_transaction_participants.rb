class CreateTransactionParticipants < ActiveRecord::Migration
  def self.up
    create_table :transaction_participants do |t|
      t.integer :transaction_record_id, :null => false
      t.string :type, :null => false
      t.integer :participant_person_id, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_participants
  end
end
