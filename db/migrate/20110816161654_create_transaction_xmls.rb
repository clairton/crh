class CreateTransactionXmls < ActiveRecord::Migration
  def self.up
    create_table :transaction_xmls do |t|
      t.integer :transaction_record_id, :null => false
      t.text :content, :null => false
      t.string :name, :null => false, :limit => 200
      t.string	:xml_file_name, :null => false
      t.string :xml_content_type, :null => false
      t.integer	:xml_file_size, :null => false
      t.datetime	:xml_updated_at, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_xmls
  end
end
