class Transaction::Financier < ActiveRecord::Base
	belongs_to :Note, :class_name => "Financier::Note"
	belongs_to :Record, :class_name => "Transaction::Record"
	validates_presence_of :transaction_record_id
	validates_presence_of :financier_note_id
end
