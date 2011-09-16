class Transaction::Financier < ActiveRecord::Base
	belongs_to :financier_note, :class_name => "Financier::Note"
	belongs_to :transaction_record, :class_name => "Transaction::Record::Record"
	validates_presence_of :transaction_record_id
	validates_presence_of :financier_note_id
  	validates_uniqueness_of :financier_note_id
end
