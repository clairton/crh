class CreateTaxeTypes < ActiveRecord::Migration
  def self.up
    create_table :taxe_types do |t|
      t.string :name, :null => false, :limit => 200
      t.text :remark
      t.boolean :active, :null => false, :default => false
      t.integer :taxe_group_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :taxe_types
  end
end

