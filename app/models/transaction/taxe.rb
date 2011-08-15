class Transaction::Taxe < ActiveRecord::Base
	belongs_to :Record, :class_name => "Transaction::Record"
	has_one :Value, :class_name => "Taxe::Value"
	validates_presence_of :transaction_record_id
	validates_presence_of :taxe_value_id
end
