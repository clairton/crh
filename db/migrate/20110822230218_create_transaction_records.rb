class CreateTransactionRecords < ActiveRecord::Migration
  def self.up
    create_table :transaction_records do |t|
      t.date :creation_date, :null => false
      t.integer :code, :null => false
      t.string :name, :null => false
      t.decimal :tot, :null => false, :precision => 15, :scale => 6
      t.decimal :goods, :null => false, :precision => 15, :scale => 6      
      t.text :remark
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_records
  end
end
