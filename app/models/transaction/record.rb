class Transaction::Record < ActiveRecord::Base
  has_many :transactionParticipant, :class_name => "Transaction::Participant", :dependent => :destroy, :foreign_key => "transaction_record_id"
  has_many :transactionFinancier, :class_name => "Transaction::Financier", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transactionTaxe, :class_name => "Transaction::Taxe", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transactionTot, :class_name => "Transaction::tot", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transactionItem, :class_name => "Transaction::Goods::Item", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_one :transactionXml, :class_name => "Transaction::xml", :dependent => :destroy , :foreign_key => "transaction_record_id"
  validates_presence_of :creation_date, :code, :name
  validates_uniqueness_of :code
end

