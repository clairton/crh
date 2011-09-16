class Goods::Item < ActiveRecord::Base
  belongs_to :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  validates_uniqueness_of :code
  validates_presence_of :name, :code
end
