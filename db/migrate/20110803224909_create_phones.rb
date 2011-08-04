class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :number, :null => false
      t.text :remark
      t.integer :person_id, :null => false
      t.integer :extension
      t.integer :place_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
