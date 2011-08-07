class CreateEmailDomains < ActiveRecord::Migration
  def self.up
    create_table :email_domains do |t|
      t.string :name, :null => false, :limit => 200
      t.text :remark
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :email_domains
  end
end

