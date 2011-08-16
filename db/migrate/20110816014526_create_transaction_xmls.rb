class CreateTransactionXmls < ActiveRecord::Migration
  def self.up
    create_table :transaction_xmls do |t|
      t.integer :transaction_record_id, :null => false
      t.text :xml, :null => false
      t.string :name, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_xmls
  end
end
