class CreateTransactionGoodsTaxes < ActiveRecord::Migration
  def self.up
    create_table :transaction_goods_taxes do |t|
      t.integer :taxe_value_id, :null => false
      t.integer :transaction_goods_item_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_goods_taxes
  end
end
