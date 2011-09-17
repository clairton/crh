class CreateTransactionParticipants < ActiveRecord::Migration
  def self.up
    create_table :transaction_participants do |t|
      t.references :participant_type, :null => false
      t.references :transaction_record, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_participants
  end
end
