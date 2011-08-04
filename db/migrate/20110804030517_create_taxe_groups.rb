class CreateTaxeGroups < ActiveRecord::Migration
  def self.up
    create_table :taxe_groups do |t|
      t.string :name
      t.text :remark
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :taxe_groups
  end
end
