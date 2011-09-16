class Transaction::Record < ActiveRecord::Base
  has_many :transaction_participant, :class_name => "Transaction::Participant"
  has_many :transaction_financier, :class_name => "Transaction::Financier"
  has_many :transaction_taxe, :class_name => "Transaction::Taxe"
  has_many :transaction_tot, :class_name => "Transaction::Tot"
  has_many :transaction_goods_item, :class_name => "Transaction::Goods::Item"
  has_one :transaction_xml, :class_name => "Transaction::Xml"
  validates_presence_of :creation_date, :code, :name
  validates_uniqueness_of :code
end
