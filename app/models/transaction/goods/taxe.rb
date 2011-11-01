class Transaction::Goods::Taxe < ActiveRecord::Base
  belongs_to :goodsTaxeValue, :class_name => "Taxe::Value", :dependent => :destroy, :foreign_key => "taxe_value_id"
  belongs_to :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_presence_of :transaction_goods_item_id, :taxe_value_id
  validates_associated :goodsTaxeValue, :class_name => "Taxe::Value", :dependent => :destroy, :foreign_key => "taxe_value_id"
  validates_associated :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_uniqueness_of :taxe_value_id
end
