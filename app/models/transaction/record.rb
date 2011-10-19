class Transaction::Record < ActiveRecord::Base
  has_many :transactionParticipant, :class_name => "Transaction::Participant", :dependent => :destroy, :foreign_key => "transaction_record_id"
  has_many :transactionFinancier, :class_name => "Transaction::Financier", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :Taxe, :class_name => "Transaction::Taxe"
  has_many :Tot, :class_name => "Transaction::Tot"
  has_many :Item, :class_name => "Transaction::Goods::Item"
  has_one :Xml, :class_name => "Transaction::Xml"
  validates_presence_of :creation_date, :code, :name
  validates_uniqueness_of :code
end
