class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :domain, :null => false, :limit => 200
      t.string :name, :null => false, :limit => 200
      t.text :remark
      t.integer :email_type_id, :null => false
      t.integer :person_id, :null => false 

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
