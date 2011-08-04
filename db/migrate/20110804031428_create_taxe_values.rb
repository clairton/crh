class CreateTaxeValues < ActiveRecord::Migration
  def self.up
    create_table :taxe_values do |t|
      t.integer :taxe_type_id
      t.decimal :percentage
      t.decimal :basis
      t.decimal :value

      t.timestamps
    end
  end

  def self.down
    drop_table :taxe_values
  end
end
