class CreateTransactionTaxes < ActiveRecord::Migration
  def self.up
    create_table :transaction_taxes do |t|
      t.integer :taxe_value_note_id, :null => false
      t.integer :transaction_record_id, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_taxes
  end
end
