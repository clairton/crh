class Transaction::Taxe < ActiveRecord::Base
  belongs_to :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  belongs_to :taxe_value, :class_name => "Taxe::Value", :dependent => :destroy , :foreign_key => "taxe_value_id"
  validates_presence_of :transaction_record_id
  validates_presence_of :taxe_value_id
  validates_associated :taxe_value, :class_name => "Taxe::Value", :dependent => :destroy , :foreign_key => "taxe_value_id"
  validates_associated :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  validates_uniqueness_of :taxe_value_id
end
