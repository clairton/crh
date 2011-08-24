class Transaction::Goods::Taxe < ActiveRecord::Base
  belongs_to :Value, :class_name => "Taxe::Value"
  belongs_to :Item, :class_name => "Transaction::Goods::Item"
  validates_presence_of :transaction_goods_item_id
  validates_presence_of :taxe_value_id
  validates_associated :Value, :class_name => "Taxe::Value"
  validates_associated :Item, :class_name => "Transaction::Goods::Item"
end
