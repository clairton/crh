class Transaction::Goods::Item < ActiveRecord::Base
  has_one :goods_item, :class_name => "Goods::Item"
  belongs_to :transaction_record, :class_name => "Transaction::Record::Record"
  has_many :transaction_goods_taxe, :class_name => "Transaction::Goods::Taxe"
  has_many :transaction_goods_dditional, :class_name => "Transaction::Goods::Additional"
  validates_presence_of :transaction_record_id
  validates_presence_of :goods_item_id
  validates_associated :goods_item, :class_name => "Goods::Item"
  validates_associated :transaction_record, :class_name => "Transaction::Record::Record"
end
