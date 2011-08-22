class CreateGoodsAdditionalTypes < ActiveRecord::Migration
  def self.up
    create_table :goods_additional_types do |t|
      t.string :name, :null => false, :limit => 200
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_additional_types
  end
end
