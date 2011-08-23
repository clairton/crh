class CreateTransactionRecordTots < ActiveRecord::Migration
  def self.up
    create_table :transaction_record_tots do |t|
      t.integer :transaction_record_record_id, :null => false
      t.integer :goods_additional_value_id, :null => false
      t.text :remark
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_record_tots
  end
end
