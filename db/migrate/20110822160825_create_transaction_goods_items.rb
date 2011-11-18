class CreateTransactionGoodsItems < ActiveRecord::Migration
  def self.up
    create_table :transaction_goods_items do |t|
      t.references :goods_item
      t.references :transaction_record
      t.string :name, :null => false, :limit => 200
      t.string :measure, :null => false, :limit => 6
      t.decimal :quantity, :null => false, :precision => 10, :scale => 4
      t.decimal :unit_price, :null => false, :precision => 10, :scale => 4
      t.decimal :full_price, :null => false, :precision => 10, :scale => 2
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_goods_items
  end
end
