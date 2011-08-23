class Transaction::Record::Record < ActiveRecord::Base
  has_many :Participant, :class_name => "Transaction::Participant"
  has_many :Financier, :class_name => "Transaction::Financier"
  has_many :Taxe, :class_name => "Transaction::Record::Taxe"
  has_many :Tot, :class_name => "Transaction::Record::Tot"
  has_many :Item, :class_name => "Transaction::Goods::Item"
  has_one :Xml, :class_name => "Transaction::Xml"
  validates_presence_of :creation_date, :code, :name
end
