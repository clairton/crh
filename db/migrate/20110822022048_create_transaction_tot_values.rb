class CreateTransactionTotValues < ActiveRecord::Migration
  def self.up
    create_table :transaction_tot_values do |t|
      t.references :transaction_record, :null => false
      t.references :transaction_tot_type, :null => false
      t.decimal :value, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_tot_values
  end
end
