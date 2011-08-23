class CreateTransactionRecords < ActiveRecord::Migration
  def self.up
    create_table :transaction_records do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_records
  end
end
