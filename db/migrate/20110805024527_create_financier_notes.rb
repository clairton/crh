class CreateFinancierNotes < ActiveRecord::Migration
  def self.up
    create_table :financier_notes do |t|
      t.decimal :original_value
      t.date :expiration_date
      t.date :creation_date
      t.string :name
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :financier_notes
  end
end
