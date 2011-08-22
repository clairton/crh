class CreateTransactionTotTypes < ActiveRecord::Migration
  def self.up
    create_table :transaction_tot_types do |t|
      t.string :name
      t.boolean :active
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_tot_types
  end
end
