class CreateTaxes < ActiveRecord::Migration
  def self.up
    create_table :taxes do |t|
      t.string :name, :null => false, :limit => 200
      t.text :remark
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :taxes
  end
end

