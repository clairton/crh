class Transaction::Taxe < ActiveRecord::Base
  belongs_to :taxe_value, :class_name => "Taxe::Value"
  belongs_to :transaction_record, :class_name => "Transaction::Record"
  validates_presence_of :transaction_record_id
  validates_presence_of :taxe_value_id
  validates_associated :taxe_value, :class_name => "Taxe::Value"
  validates_associated :transaction_record, :class_name => "Transaction::Record"
  validates_uniqueness_of :taxe_value_id
end
