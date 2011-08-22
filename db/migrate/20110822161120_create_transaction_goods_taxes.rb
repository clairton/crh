class CreateTransactionGoodsTaxes < ActiveRecord::Migration
  def self.up
    create_table :transaction_goods_taxes do |t|
      t.references :taxe_value
      t.references :transaction_goods_item
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_goods_taxes
  end
end
