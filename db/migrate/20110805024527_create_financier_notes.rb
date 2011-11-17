class CreateFinancierNotes < ActiveRecord::Migration
  def self.up
    create_table :financier_notes do |t|
      t.decimal :original_value, :null => false,:precision => 15, :scale => 6
      t.date :expiration_date, :null => false
      t.date :creation_date, :null => false
      t.string :name, :null => false, :limit => 20
      t.integer :number, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :financier_notes
  end
end
