class CreateGoodsAdditionalValues < ActiveRecord::Migration
  def self.up
    create_table :goods_additional_values do |t|
      t.decimal :value, :null => false
      t.goods_addiotional_type :references, :null => false
      t.boolean :active, :null => false, :default => true
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_additional_values
  end
end
