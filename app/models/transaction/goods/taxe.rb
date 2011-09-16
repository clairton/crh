class Transaction::Goods::Taxe < ActiveRecord::Base
  belongs_to :taxe_value, :class_name => "Taxe::Value"
  belongs_to :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  validates_presence_of :transaction_goods_item_id
  validates_presence_of :taxe_value_id
  validates_associated :taxe_value, :class_name => "Taxe::Value"
  validates_associated :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  validates_uniqueness_of :taxe_value_id
end
