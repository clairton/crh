class CreateTransactionItems < ActiveRecord::Migration
  def self.up
    create_table :transaction_items do |t|
      t.integer :goods_item_id, :null => false
      t.integer :transaction_record_id, :null => false
      t.string :name, :null => false, :limit => 200
      t.string :measure, :null => false, :limit => 6
      t.decimal :quantity, :null => false, :limit => 200
      t.decimal :unit_price, :null => false, :precision => 10, :scale => 4
      t.decimal :full_price, :null => false, :precision => 10, :scale => 2
      t.text :remark
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_items
  end
end
