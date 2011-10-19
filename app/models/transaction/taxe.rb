class Transaction::Taxe < ActiveRecord::Base
  belongs_to :transactionRecord, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  belongs_to :taxeValue, :class_name => "Taxe::Value", :dependent => :destroy , :foreign_key => "taxe_value_id"
  validates_presence_of :transaction_record_id
  validates_presence_of :taxe_value_id
  validates_associated :taxeValue, :class_name => "Taxe::Value", :dependent => :destroy , :foreign_key => "taxe_value_id"
  validates_associated :transactionRecord, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  validates_uniqueness_of :taxe_value_id
end
