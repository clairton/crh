class Transaction::Goods::Item < ActiveRecord::Base
  has_one :Item, :class_name => "Goods::Item"
  belongs_to :Record, :class_name => "Transaction::Record::Record"
  has_many :Taxe, :class_name => "Transaction::Goods::Taxe"
  has_many :Additional, :class_name => "Transaction::Goods::Additional"
  validates_presence_of :transaction_record_record_id
  validates_presence_of :goods_item_id
  validates_associated :Item, :class_name => "Goods::Item"
  validates_associated :Record, :class_name => "Transaction::Record::Record"
end
