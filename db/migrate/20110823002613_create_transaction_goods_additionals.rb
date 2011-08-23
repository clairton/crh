class CreateTransactionGoodsAdditionals < ActiveRecord::Migration
  def self.up
    create_table :transaction_goods_additionals do |t|
      t.integer :transaction_goods_item_id, :null => false
      t.integer :goods_additional_id, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_goods_additionals
  end
end
