class CreateTransactionItemTaxes < ActiveRecord::Migration
  def self.up
    create_table :transaction_item_taxes do |t|
      t.integer :transaction_item_id, :null => false
      t.integer :taxe_value_id, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_item_taxes
  end
end
