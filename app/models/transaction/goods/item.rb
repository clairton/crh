class Transaction::Goods::Item < ActiveRecord::Base
  belongs_to :goodsItem, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  belongs_to :transactionRecord, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  has_many :transactionGoodsTaxe, :class_name => "Transaction::Goods::Taxe",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  has_many :transactionGoodsAdditional, :class_name => "Transaction::Goods::Additional",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_presence_of :transaction_record_id, :goods_item_id
  #validates_associated :goodsItem, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  validates_associated :transactionRecord, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
end
