class Transaction::Record < ActiveRecord::Base
  has_one :Delivery, :class_name => "Transaction::Delivery"
  has_one :Sender, :class_name => "Transaction::Sender"
  has_one :Issuer, :class_name => "Transaction::Issuer"
  has_many :Financier, :class_name => "Transaction::Financier"
  has_many :RecordTaxe, :class_name => "Transaction::RecordTaxe"
  has_many :Item, :class_name => "Transaction::Item"
  has_one :Xml, :class_name => "Transaction::Xml"  
  has_many :Value, :class_name => "Transaction::Tot::Value"
end
