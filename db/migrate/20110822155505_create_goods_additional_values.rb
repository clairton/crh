class CreateGoodsAdditionalValues < ActiveRecord::Migration
  def self.up
    create_table :goods_additional_values do |t|
      t.decimal :value, :null => false
      t.integer :goods_additional_type_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_additional_values
  end
end
