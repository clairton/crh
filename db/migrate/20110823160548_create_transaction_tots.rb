class CreateTransactionTots < ActiveRecord::Migration
  def self.up
    create_table :transaction_tots do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_tots
  end
end
