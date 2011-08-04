class CreateTaxeTypes < ActiveRecord::Migration
  def self.up
    create_table :taxe_types do |t|
      t.string :name
      t.text :remark
      t.boolean :active
      t.integer :taxe_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :taxe_types
  end
end
