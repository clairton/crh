class CreateTransactionFinanciers < ActiveRecord::Migration
  def self.up
    create_table :transaction_financiers do |t|
      t.integer :financier_note_id, :null => false
      t.integer :transaction_record_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_financiers
  end
end
