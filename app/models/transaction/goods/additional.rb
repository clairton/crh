class Transaction::Goods::Additional < ActiveRecord::Base
  belongs_to :goods_additional_value, :class_name => "Goods::Additional::Value", :dependent => :destroy, :foreign_key => "goods_additional_value_id"
  belongs_to :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_presence_of :transaction_goods_item_id, :goods_additional_value_id
  validates_associated :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_associated :goods_additional_value, :class_name => "Goods::Additional::Value", :dependent => :destroy, :foreign_key => "goods_additional_value_id"
  validates_uniqueness_of :goods_additional_value_id
end
