class CreatePersonTypes < ActiveRecord::Migration
  def self.up
    create_table :person_types do |t|
      t.string :name, :limit => 200, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :person_types
  end
end