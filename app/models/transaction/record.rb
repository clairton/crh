class Transaction::Record < ActiveRecord::Base
  has_many :transaction_participant, :class_name => "Transaction::Participant", :dependent => :destroy, :foreign_key => "transaction_record_id"
  has_many :transaction_financier, :class_name => "Transaction::Financier", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_taxe, :class_name => "Transaction::Taxe", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_tot, :class_name => "Transaction::Tot", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_many :transaction_item, :class_name => "Transaction::Goods::Item", :dependent => :destroy , :foreign_key => "transaction_record_id"
  has_one :transaction_xml, :class_name => "Transaction::Xml", :dependent => :destroy , :foreign_key => "transaction_record_id"
  validates_presence_of :creation_date, :code, :name
  validates_uniqueness_of :code
end

