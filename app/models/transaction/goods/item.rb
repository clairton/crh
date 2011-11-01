class Transaction::Goods::Item < ActiveRecord::Base
  belongs_to :goods_item, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  belongs_to :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  has_many :transaction_goods_taxe, :class_name => "Transaction::Goods::Taxe",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  has_many :transaction_goods_additional, :class_name => "Transaction::Goods::Additional",:foreign_key=>"transaction_goods_item_id" ,:dependent => :destroy
  validates_presence_of :transaction_record_id, :goods_item_id
  validates_associated :goods_item, :class_name => "Goods::Item", :foreign_key => "goods_item_id"
  validates_associated :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
end
