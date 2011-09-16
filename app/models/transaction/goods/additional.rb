class Transaction::Goods::Additional < ActiveRecord::Base
  belongs_to :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  has_many :goods_additional_value, :class_name => "Goods::Additional::Value"
  validates_presence_of :transaction_goods_item_id, :goods_additional_value_id
  validates_associated :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  validates_associated :goods_additional_value, :class_name => "Goods::Additional::Value"
  validates_uniqueness_of :goods_additional_value_id
end
