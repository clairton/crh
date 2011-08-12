class CreateEmailUsers < ActiveRecord::Migration
  def self.up
    create_table :email_users do |t|
      t.string :name, :null => false, :limit => 200
      t.integer :email_domain_id, :null => false
      t.text :remark
      t.boolean :active, :default => true, :null => false
      t.string :password
      t.integer :domain_id

      t.timestamps
    end
  end

  def self.down
    drop_table :email_users
  end
end

