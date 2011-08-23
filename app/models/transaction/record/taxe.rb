class Transaction::Record::Taxe < ActiveRecord::Base
  belongs_to :Record, :class_name => "Transaction::Record::Record"
  has_one :Value, :class_name => "Taxe::Value"
  validates_presence_of :transaction_record_record_id
  validates_presence_of :taxe_value_id
  validates_associated :Value, :class_name => "Taxe::Value"
  validates_associated :Record, :class_name => "Transaction::Record::Record"
end