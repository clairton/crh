class Transaction::Goods::Taxe < ActiveRecord::Base
  belongs_to :goods_taxe_value, :class_name => "Taxe::Value", :dependent => :destroy, :foreign_key => "taxe_value_id"
  belongs_to :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id"
  validates_associated :goods_taxe_value, :class_name => "Taxe::Value", :foreign_key => "taxe_value_id"
  validates_associated :transaction_item, :class_name => "Transaction::Goods::Item",:foreign_key=>"transaction_goods_item_id"
  validates_presence_of :transaction_goods_item_id, :taxe_value_id
  validates_uniqueness_of :taxe_value_id
end
