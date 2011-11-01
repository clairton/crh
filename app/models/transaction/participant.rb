class Transaction::Participant < ActiveRecord::Base
  belongs_to :participant_type, :class_name => "Participant::Type", :foreign_key => "participant_type_id"
  belongs_to :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  validates_presence_of :transaction_record_id,:participant_type_id
  validates_associated :transaction_record, :class_name => "Transaction::Record", :foreign_key => "transaction_record_id"
  validates_associated :participant_type, :class_name => "Participant::Type", :foreign_key => "participant_type_id"
end
