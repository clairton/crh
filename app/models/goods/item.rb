class Goods::Item < ActiveRecord::Base
  has_many :transactionItem, :class_name => "Transaction::Goods::Item", :foreign_key => "transaction_goods_item_id", :dependent => :destroy
  validates_uniqueness_of :code
  validates_presence_of :name, :code
end
