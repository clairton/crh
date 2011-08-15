class Transaction::Record < ActiveRecord::Base
  has_one :Delivery, :class_name => "Transaction::Delivery"
  has_one :Sender, :class_name => "Transaction::Sender"
  has_one :Issuer, :class_name => "Transaction::Issuer"
  has_many :Financier, :class_name => "Transaction::Financier"
  has_many :Taxe, :class_name => "Transaction::Taxe"
end
