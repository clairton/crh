class CreateTaxeValues < ActiveRecord::Migration
  def self.up
    create_table :taxe_values do |t|
      t.integer :taxe_type_id, :null => false
      t.decimal :percentage, :null => false, :default => 0.00, :precision => 10, :scale => 2
      t.decimal :basis, :null => false, :default => 0.00, :precision => 10, :scale => 2
      t.decimal :value, :null => false, :precision => 15, :scale => 6
      t.decimal :reduction, :null => false, :precision => 10, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :taxe_values
  end
end

