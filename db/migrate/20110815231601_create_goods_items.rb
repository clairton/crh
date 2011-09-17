class CreateGoodsItems < ActiveRecord::Migration
  def self.up
    create_table :goods_items do |t|
      t.string :code, :null => false, :limit => 20
      t.string :name, :null => false, :limit => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_items
  end
end
