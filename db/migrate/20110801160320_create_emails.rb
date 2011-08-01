class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :domain, :limit => 200, :null=>false
      t.string :name, :limit => 200, :null=>false
      t.boolean :active, :default => true, :null=>false
      t.text :remark
      t.integer :email_type_id, :null=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
