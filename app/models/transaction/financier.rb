class Transaction::Financier < ActiveRecord::Base
	belongs_to :financierNote, :class_name => "Financier::Note",:foreign_key => "financier_note_id", :dependent => :destroy
	belongs_to :transactionRecord, :class_name => "Transaction::Record",:foreign_key => "transaction_record_id"
	validates_presence_of :transaction_record_id
	validates_presence_of :financier_note_id
  validates_uniqueness_of :financier_note_id
  validates_associated :financierNote, :class_name => "Financier::Note",:foreign_key => "financier_note_id"
  validates_associated :transactionRecord, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
end
