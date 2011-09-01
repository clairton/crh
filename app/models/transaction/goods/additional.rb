class Transaction::Goods::Additional < ActiveRecord::Base
  belongs_to :Item, :class_name => "Transaction::Goods::Item"
  has_many :Value, :class_name => "Goods::Additional::Value"
  validates_presence_of :transaction_goods_item_id, :goods_additional_value_id
  validates_associated :Item, :class_name => "Transaction::Goods::Item"
  validates_associated :Value, :class_name => "Goods::Item::Additional::Value"
  validates_uniqueness_of :goods_additional_value_id
end
