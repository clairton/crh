class CreateTransactionRecords < ActiveRecord::Migration
  def self.up
    create_table :transaction_records do |t|
      t.date :creation_date, :null => false
      t.integer :code, :null => false
      t.string :name, :null => false
      t.decimal :tot, :null => false, :precision => 10, :scale => 4
      t.decimal :goods, :null => false, :precision => 10, :scale => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_records
  end
end
