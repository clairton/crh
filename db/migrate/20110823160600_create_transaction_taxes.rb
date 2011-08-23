class CreateTransactionTaxes < ActiveRecord::Migration
  def self.up
    create_table :transaction_taxes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_taxes
  end
end
